class ApplicationMailer < ActionMailer::Base
  default from: ENV['my_email']
  layout 'mailer'
end
