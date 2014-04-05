class LogoutController < ApplicationController

  def index
    if request.get?
      reset_session
      flash[:notice] = '注销成功.'
    end
    redirect_to :controller => "login",:action=>'index'
  end

end
