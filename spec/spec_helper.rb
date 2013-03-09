RACK_ENV='test'
require 'rspec'
require 'rack/test'
require 'json'
require './test_lti'

set :environment, :test

RSpec.configure do |config|
  config.before(:each) { DataMapper.auto_migrate! }
end

def lti_config
  @config = LtiConfig.generate("Test App")
end

def assert_error_page(msg)
  last_response.body.should match(msg)
end

def session
  last_request.env['rack.session']
end
