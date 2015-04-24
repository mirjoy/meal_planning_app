class UsersController < ApplicationController
  def new
  end

  def edit
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      UserMailer.account_confirmation(@user).deliver_now
      sign_in
    elsif User.find_by(email: params[:user][:email])
      redirect_to :back
      flash[:danger] = "An account with that email already exists."
    else
  		redirect_to :back
  		flash[:danger] = "One of your fields is not correct."
  	end
  end

  def update
    if current_user.update(user_params)
      flash[:alert] = "Your information has been updated."
      redirect_to account_path
    else
      flash[:danger] = "You are missing some fields."
      redirect_to :back
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