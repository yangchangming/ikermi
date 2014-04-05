class LoginController < ApplicationController

  layout "application"

  def index
  end

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
        redirect_to cpanel_posts_path
      else
        flash[:notice] = "邮箱或者密码不匹配."
        redirect_to :action=> 'index'
      end
    end

  end

end
