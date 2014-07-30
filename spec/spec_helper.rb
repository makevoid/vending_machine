ENV["app_env"] = "test"

require_relative "../config/env"

# rspec configurations

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end