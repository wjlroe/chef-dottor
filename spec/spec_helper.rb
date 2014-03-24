require 'rspec'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/server'

RSpec.configure do |config|
  config.expect_with :rspec do |spec|
    spec.syntax = :expect
  end

  config.order = 'random'

  config.log_level = :fatal
end
