ActionController::Routing::Routes.draw do |map|
  map.connect '', :controller => 'sentry'
  
  map.resources :users

  map.resources :users

  map.resources :verifications

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
