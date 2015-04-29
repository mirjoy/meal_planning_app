# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_confirmation
  def account_confirmation
    user = User.first
    UserMailer.account_confirmation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
  	user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
