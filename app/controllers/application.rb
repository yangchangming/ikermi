# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '12a14a3265ee5930762d9f6a66893d69'
  
  #所有的controller都可以直接使用该model中的方法
  include LoginSystem,FileProcess
  
end
