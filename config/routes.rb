ActionController::Routing::Routes.draw do |map|  map.resources :archives
  map.resources :documents
  map.resources :clips
  map.resources :groups
  map.resources :users

  map.root :controller => 'cyl', :action => 'crestas'

  map.connect 'calendario/:month/:year', :controller => 'cyl', :action => 'calendar'
  map.connect 'calendario', :controller => 'cyl', :action => 'calendar'
  map.connect 'admin/:action/:id', :controller => 'admin'
  map.connect ':action/:id', :controller => 'cyl'
  map.connect ':action/:id.:format', :controller => 'cyl'
end
