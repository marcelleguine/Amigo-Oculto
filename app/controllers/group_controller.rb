class GroupController < ApplicationController
  
  before_filter :find, :only => [:delete, :edit, :update]
  
  def find
    @group = Group.find params[:id]
  end
  
  def new 
    @group = Group.new
  end
  
  def create
    @group = Group.new params[:group]
    @group.participates.build :user => current_user, :status => 2
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end
 
  def delete    
    if @group.destroy
      redirect_to root_path, :notice => "Grupo deletado"
    else
      redirect_to root_path, :alert => "Erro ao deletar o grupo"
    end
  end
  
  def edit
        
  end
  
  def update    
    if @group.update_attributes(params[:group])
      redirect_to root_path
    else
      render :edit
    end
  end
  
end
