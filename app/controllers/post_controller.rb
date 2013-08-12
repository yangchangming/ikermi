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
      
      if @tags.save
        @post.tags << @tags          
      else
        @tags = Tag.find_by_tag_name(@tags.tag_name)
        @post.tags << @tags 
      end

      flash[:notice] = "保存成功."      
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
