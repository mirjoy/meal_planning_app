class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(auth_hash)
    sign_in
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def sign_in
    session[:user_id] = @user.id
    redirect_to :back, notice: "Sign in successful"
  end
end