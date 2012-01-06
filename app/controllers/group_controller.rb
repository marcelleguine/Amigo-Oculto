# coding: utf-8
class GroupController < ApplicationController
  
  before_filter :validate_user_in_group, :only => [:show, :exit]
  before_filter :admin_validate, :only => [:delete, :edit, :update, :invite]
  before_filter :find, :only => [:accept]
  
  def find
    @group = Group.find params[:id]
    @users = {}
    @group.participates.each do |p|
      @users[p.user] = p
    end
  end
  
  def validate_user_in_group
    find
    unless @users.include? current_user
      redirect_to root_path, :alert => "Você não pertence a esse grupo" and return false
    end
    return true
  end
  
  def admin_validate
    return unless validate_user_in_group
    unless @users[current_user].status == 2
      redirect_to root_path, :alert => "Você não é o administrador do grupo" and return
    end
  end
  
  def new 
    @group = Group.new
  end
  
  def create
    @group = Group.new params[:group]
    @group.participates.build :user => current_user, :status => 2
    if @group.save
      redirect_to root_path and return
    else
      render :new
    end
  end
 
  def delete    
    if @group.destroy
      redirect_to root_path, :notice => "Grupo deletado" and return
    else
      redirect_to root_path, :alert => "Erro ao deletar o grupo" and return
    end
  end
  
  def edit
  end
  
  def update    
    if @group.update_attributes(params[:group])
      redirect_to root_path and return
    else
      render :edit
    end
  end
  
  def show
    @invitation = Invitation.new    
  end
  
  def invite
    if @users[current_user].status == 2
      @invitation = Invitation.new
      @invitation.group = @group
      @invitation.user = current_user
      @invitation.status = 0    
      @invitation.code = Digest::MD5::hexdigest "#{DateTime.now} #{@group.name} #{params[:email]}"
    
      if @invitation.save
        UserMailer.invite_email(@invitation, params[:email]).deliver
        redirect_to show_group_path @group
      else 
        redirect_to show_group_path(@group), :alert => "Não foi possível criar o convite"
      end  
    else
      redirect_to show_group_path(@group), :alert => "Você não pode fazer convites"
    end
  end
  
  def accept
    unless user_signed_in?
      redirect_to root_path, :alert => "Você não está logado" and return
    end
    @invitation = Invitation.find_by_code params[:code]
    if @users.include? current_user
      redirect_to show_group_path(@invitation.group), :alert => "Você já está neste grupo" and return
    end   
    unless @invitation.status == 0
      redirect_to root_path, :alert => "Convite inválido" and return
    end
    @invitation.status = 1
    group = @invitation.group
    group.participates.build :user => current_user, :status => 0
    
    if group.save and @invitation.save
      redirect_to show_group_path group
    else
      redirect_to root_path, :alert => "Convite inválido"
    end   
  end
  
  def exit
    if @users[current_user].destroy
      redirect_to root_path, :notice => "Você saiu deste grupo"
    else
      redirect_to root_path, :alert => "Você não conseguiu sair deste grupo"
    end
  end
end
