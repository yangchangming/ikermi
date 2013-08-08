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
    @tags = Tag.new
  end

  def create
    @post = Post.new(params[:post])
    @tags = Tag.new(params[:tags])


    if @post.save && request.post?
      @tags.is_valid = true
      
      # tag不存在的情况下，保存新tag，这个部分逻辑应该放在tagmodel中
      # TODO..
      if @tags.save
        @post.tags << @tags  

        flash[:notice] = "保存成功."
      end
      
    else
      # 将model错误信息提示转移到flash中
      flash[:notice] = []
      @post.errors.each do |property, error| 
        flash[:notice] << error + "<br/>" 
      end  
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
