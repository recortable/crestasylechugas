ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'cyl'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
