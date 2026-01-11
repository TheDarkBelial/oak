if ENV["COVERAGE"].present?
  require "simplecov"

  SimpleCov.start(:rails) do
    add_group "Components", "app/components"
    add_group "Forms", "app/forms"
    add_group "Services", "app/services"
  end
end

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/mock"
require "minitest/reporters"
require "webmock/minitest"

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

WebMock.disable_net_connect!(allow_localhost: true)

Dir[Rails.root.join("test", "test_helpers", "**", "*.rb")].each { |file| require file }

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    if ENV["COVERAGE"]
      parallelize_setup do |worker|
        SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
      end

      parallelize_teardown do |worker|
        SimpleCov.result
      end
    end

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
