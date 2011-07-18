ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'countdown.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Sinatra::Application

class CountOnMeWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  CountOnMeWorld.new
end
