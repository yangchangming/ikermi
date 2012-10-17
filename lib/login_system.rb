# 会话处理库

module LoginSystem
  protected
  
  #验证指定用户是否已经登录  
  def is_logged_in?
    @logged_in_user = User.find(session[:user]) if session[:user]
    if @logged_in_user.nil?
      flash[:notice] = "请先登陆！"
      redirect_to :controller=>'admin',:action=>'index'
    end
    
  end
  
  def logged_in_user
    return @logged_in_user if is_logged_in?
  end
  
  #用户登录 user作为参数传递
  def logged_in_user=(user)
    if !user.nil?
      session[:user] = user
      @logged_in_user = user
    end
  end
  
  #将指定的方法作为视图辅助方法来使用
  def self.included(base)
    base.send :helper_method,:is_logged_in?,:logged_in_user
  end
  
end
