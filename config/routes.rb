ActionController::Routing::Routes.draw do |map|

  #设定系统首页
  map.root :controller => 'blog', :action => 'index'

  #创建restful路由
  #map.resources :users, :member => {:enable => :put}
  #map.show_user '/user/:username', :controller => 'users', :action => 'show_by_username'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect '*anything', :controller => "blog",:action => "error"

  # 设定命名空间 cpanel
  map.namespace (:cpanel) do |cpanel|
    cpanel.resources :users
    cpanel.resources :auth
    cpanel.resources :comments
    cpanel.resources :posts
  end

end
