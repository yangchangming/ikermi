class Cpanel::UsersController < CpanelController

  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def show_by_username
    @user = User.find_by_username(params[:username])
    render :action=>'show'
  end

  def new
    @user = User.new
  end



  #创建用户
  def create
    @user = User.new(params[:user])
    if @user.save && request.post?
      self.logged_in_user = @user
      flash[:notice] = @user.username + ".注册成功!"
      redirect_to cpanel_posts_path
    else 
      #将model错误信息提示转移到flash中
      flash[:notice] = []
      @user.errors.each { |property, error| flash[:notice] << error }   
      redirect_to :controller=>'register',:action=>'index'
    end
  end
  
  
  

  def edit
    @user = logged_in_user
  end

  def update
    @user = User.find(logged_in_user)
    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated"
      redirect_to :action=>'show',:id=>logged_in_user
    else
      render :action=>'edit'
    end
  end
  

  def destory
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled,false)
      flash[:notice] = 'User disabled'
    else
      flash[:error] = 'There was a problem disabling this user.'
    end
    redirect_to :action=>'index'
  end
  
  def enable
    @user = User.find(params[:id])
    if @user.update_attribute(:enabled,true)
      flash[:notice] = "User enabled"
    else
      flash[:error] = "There was a problem enabling this user"
    end
    redirect_to :action=>'index'
  end
end
