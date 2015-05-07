class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= CurrentUser.new(User.find_by(id: session[:user_id]))
  end
  helper_method :current_user

  def sign_in
    session[:user_id] = @user.id
    redirect_to new_meal_path, notice: "Sign in successful"
  end
  helper_method :sign_in
end
