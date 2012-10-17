class AdminController < ApplicationController
    layout "admin"
    before_filter :is_logged_in?,:only=>[:panel]
    
    def index
    end
    
    def register
      @user = User.new
    end
    
    #后台管理登录
    def login
      @user = User.new(params[:user])
      if @user.email.blank? || @user.password.blank?
        flash[:notice] = '邮箱或密码不能为空.'
        redirect_to :action=>'index'
      end
      
      if !@user.email.blank? && !@user.password.blank?
        user = User.authenticate(@user.email,@user.password)
        if !user.nil?
           session[:user] = user
           flash[:notice] =  user.username  + '登陆成功.'
           redirect_to :controller=>'post' ,:action=>'index'
        else
           flash[:notice] = "邮箱或者密码不匹配."
           redirect_to :action=> 'index'
        end
        
      end
      
      
    end
    
    
    def panel
    end
    
    
    #注销
    def logout
      if request.get?
        reset_session
        flash[:notice] = '注销成功.'
      end
      redirect_to :action=>'index'
    end
    
end
