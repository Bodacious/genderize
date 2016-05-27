# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require "support/deferred_garbage_collection"

require "genderize"
include Genderize # make the Gender class available in specs

RSpec.configure do |config|
  config.before(:all) { DeferredGarbageCollection.start }
  config.after(:all)  { DeferredGarbageCollection.reconsider }
end