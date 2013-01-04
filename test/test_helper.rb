require 'rubygems'
require 'spork'
# require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../dummy/config/environment.rb",  __FILE__)
  require "rails/test_help"

  Rails.backtrace_cleaner.remove_silencers!
end

Spork.each_run do
end
