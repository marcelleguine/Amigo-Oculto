# coding: utf-8
class GroupController < ApplicationController
  
  before_filter :find, :only => [:show]
  before_filter :admin_validate, :only => [:delete, :edit, :update]
  
  def find
    @group = Group.find params[:id]
    @users = {}
    @group.participates.each do |p|
      @users[p.user] = p.status
    end
    unless @users.include? current_user
      redirect_to root_path, :alert => "Você não pertence a esse grupo" and return false
    end
    return true
  end
  
  def admin_validate
    return unless find
    unless @users[current_user] == 2
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
    
  end
  
end
