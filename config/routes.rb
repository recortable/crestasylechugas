ActionController::Routing::Routes.draw do |map|
  map.resources :groups

  map.resources :users


  map.resource :users

  map.root :controller => 'cyl'

  map.connect ':action/:id', :controller => 'cyl'
  map.connect ':action/:id.:format', :controller => 'cyl'
end
