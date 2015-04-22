class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_or_create_from_auth(auth_hash)
    sign_in
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def sign_in
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Sign in successful"
  end
end