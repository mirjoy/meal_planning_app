require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

module Delistcious
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
