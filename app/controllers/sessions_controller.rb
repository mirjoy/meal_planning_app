class SessionsController < ApplicationController
  def new
  end

  def create
    # @user = User.find_by(email: params[:session][:email])
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
end