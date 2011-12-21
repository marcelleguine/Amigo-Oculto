class GroupController < ApplicationController
  
  def new 
    @group = Group.new
  end
  
  def create
    @group = Group.new params[:group]
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end
  
end
