# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
	  :user_name => ENV['sendgrid_name'],
	  :password => ENV['sendgrid_pw'],
	  :domain => "localhost:3000",
	  :address => 'smtp.sendgrid.net',
	  :port => 587,
	  :authentication => :plain,
	  :enable_starttls_auto => true
	}
