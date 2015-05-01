require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module Delistcious
  class Application < Rails::Application
    # config.active_record.raise_in_transactional_callbacks = true

    # config.action_mailer.perform_deliveries = true
    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.default_url_options = { host: 'localhost:3000' }

  end
end
