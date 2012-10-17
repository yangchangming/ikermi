class PostController < ApplicationController
  layout "admin" 

  def index
    @posts = Post.find(:all)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save && request.post?
      flash[:notice] = "保存成功."
    else
      #将model错误信息提示转移到flash中
      flash[:notice] = []
      @post.errors.each { |property, error| flash[:notice] << error }   
    end
    redirect_to :controller=>'post',:action=>'index' 
  end

  def update
  end

  def edit
  end

  def destory
  end

  def enable
  end
end
