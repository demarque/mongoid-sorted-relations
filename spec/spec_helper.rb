require "rubygems"
require "bundler/setup"

require 'rspec'
require 'rspec-aspic'

require 'mongoid'
require File.expand_path('../../lib/mongoid-sorted-relations', __FILE__)


Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db('mongoid_sortable_relations_test')
  config.allow_dynamic_fields = false
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include RSpecAspic
  config.after :each do
    Mongoid.master.collections.reject { |c| c.name =~ /^system\./ }.each(&:drop)
  end
end
