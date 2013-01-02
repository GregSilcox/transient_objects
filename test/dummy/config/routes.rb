Rails.application.routes.draw do

  mount TransientObjects::Engine => "/transient_objects"
end
