class UsersController < ApplicationController
  def new
  	
  end

  def show
  	if !current_user
  		flash[:danger] = "You are not authorized to access this page"
  		redirect_to root_path
  	end
  end
end