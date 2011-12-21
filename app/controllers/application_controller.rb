class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index 
    @groups = Group.all
  end
  
end
