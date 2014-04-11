require 'bundler/setup'
Bundler.setup

require 'rails'
require 'rdiscount'

require_relative "../lib/vivus"
require_relative '../app/models/stylesheet'
require_relative '../app/models/component'

ENV["RAILS_ENV"] ||= 'test'


RSpec.configure do |config|
  # some (optional) config here
end
