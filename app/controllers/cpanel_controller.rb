class CpanelController < ApplicationController
  layout "cpanel"
  before_filter :require_admin

  def require_admin
    if session[:user].blank? || session[:user].username!="昌明"
      redirect_to :controller => "login",:action => "index"
      return
    end
  end

  def index
    redirect_to :controller => "cpanel/home",:action => "index"
  end


end
