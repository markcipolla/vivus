require 'bundler/setup'
Bundler.setup

require 'rails'
require 'rdiscount'

require_relative "../lib/vivus"
require_relative '../app/models/stylesheet'
require_relative '../app/models/component'
require_relative '../app/models/description'
require_relative '../app/models/example'

ENV["RAILS_ENV"] ||= 'test'


RSpec.configure do |config|
  # some (optional) config here
end
