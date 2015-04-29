ENV['RAILS_ENV'] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rspec"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

class ActiveRecord::Base
  @@shared_connection = retrieve_connection
  def self.connection
    @@shared_connection || retrieve_connection
  end
end

def user_logs_in
	
end
