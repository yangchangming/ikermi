ActionController::Routing::Routes.draw do |map|

  #map.root :controller=>'index',:action=>'index'
  map.root :controller=>'blog',:action=>'index'
  
  #创建rest 路由
  map.resources :users,:member=>{:enable=>:put}
  
  map.show_user '/user/:username',:controller=>'users',:action=>'show_by_username'

    
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '*anything',:controller=>'index',:action=>'unknow_request'
end
