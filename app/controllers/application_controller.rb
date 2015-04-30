class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def sign_in
    session[:user_id] = @user.id
    redirect_to new_meal_path, notice: "Sign in successful"
  end
  helper_method :sign_in
end
