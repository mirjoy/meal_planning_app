class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session]
      authenticate_user_by_email
    else
      @user = User.find_or_create_from_auth(auth_hash)
      # only send if user is new
      # UserMailer.account_confirmation(@user).deliver_now
      sign_in
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def authenticate_user_by_email
    if user_signed_in_with_facebook
      flash[:alert] = "Did you sign up with Facebook?"
      redirect_to :back
    elsif user_found_and_authenticated
      sign_in
    else
      flash[:alert] = "Wrong user name or password"
      redirect_to :back
    end
  end

  def user_found_and_authenticated
    @user = User.find_by(email: params[:session][:email])
    @user && @user.authenticate(params[:session][:password])
  end

  def user_signed_in_with_facebook
    @user = User.find_by(email: params[:session][:email])
    @user && @user.provider == "facebook"
  end

end