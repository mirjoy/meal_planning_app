class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      sign_in
    else
  		redirect_to :back
  		flash[:danger] = "One of your fields is not correct."
  	end
  end

  def show
  	if !current_user
      flash[:danger] = "You are not authorized to access this page"
      redirect_to root_path
  	end
  end

  private
  
   def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end