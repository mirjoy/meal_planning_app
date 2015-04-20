require "simplecov"
require "codeclimate-test-reporter"
require "capybara-webkit"
require "factory_girl_rails"

SimpleCov.start "rails"
CodeClimate::TestReporter.start
Capybara.javascript_driver = :webkit

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
  config.backtrace_exclusion_patterns << /gems\//
end
