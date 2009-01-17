ActionController::Routing::Routes.draw do |map|
  map.resources :groups

  map.resources :users


  map.resource :users

  map.root :controller => 'cyl'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
