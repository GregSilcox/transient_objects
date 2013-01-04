require 'transient_objects/version'

module TransientObjects
  class Engine < Rails::Engine
    isolate_namespace TransientObjects
  end
end
