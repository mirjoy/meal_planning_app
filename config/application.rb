require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module Delistcious
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.active_job.queue_adapter = :sidekiq

    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
		  :user_name => ENV['sendgrid_name'],
		  :password => ENV['sendgrid_pw'],
		  :domain => "localhost:3000",
		  :address => 'smtp.sendgrid.net',
		  :port => 587,
		  :authentication => :plain,
		  :enable_starttls_auto => true
		}
  end
end
