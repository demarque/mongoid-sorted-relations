require "rubygems"
require "bundler/setup"

require 'rspec'
require 'rspec-aspic'

require 'mongoid'
require File.expand_path('../../lib/mongoid-sorted-relations', __FILE__)


Mongoid.configure do |config|
  config.connect_to('mongoid_sortable_relations_test')
  config.allow_dynamic_fields = false
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include RSpecAspic
  config.after :each do
    Mongoid.purge!
  end
end
