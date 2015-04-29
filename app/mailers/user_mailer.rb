class UserMailer < ApplicationMailer
  def account_confirmation(user)
    @user = user.user_name
    mail to: user.email, subject: "Thanks for joining Delistcious!"
  end

  def password_reset(user)
    @user = user.user_name
    mail to: user.email, subject: "Your Delistcious password has been reset"
  end
end
