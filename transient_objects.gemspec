$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "transient_objects/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "transient_objects"
  s.version     = TransientObjects::VERSION
  s.authors     = ["Gregory Silcox"]
  s.email       = ["greg.silcox@cumulosity.com"]
  s.homepage    = "http://cumulosity.com"
  s.summary     = "Support objects that require no database."
  s.description = "These objects are non-persistent, and only support persistent objects, controllers or views."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "supermodel"

  # test dependencies
  s.add_development_dependency 'spork'
  s.add_development_dependency 'spork-rails'
  s.add_development_dependency 'spork-testunit'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'guard-test'
  s.add_development_dependency 'rb-inotify'
  s.add_development_dependency 'libnotify'
end
