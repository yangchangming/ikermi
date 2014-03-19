class PostController < ApplicationController
  layout "admin" 

  def index
    @posts = Post.find(:all,:order=>"created_at DESC")
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

    # TODO transactioin....
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
    #@tags = Tag.update(params[:tags])
    # TODO tag暂不支持更新

    id = params[:post][:id]
    post = Post.find(id)
    if post.update_attributes(params[:post])
      flash[:notice] = "更新成功." 
      redirect_to :controller=>'post',:action=>'index'
    else
      #render :action=>edit
    end  

  end

  def edit    
    ids = params[:ids]    
    if ids==nil || ids.size <= 0 || ids.size>1
      flash[:notice] = "请选择一篇文章!" 
      redirect_to :controller=>'post',:action=>'index'    
    else
      @post = Post.find(ids[0]) 
    end
  end

  def destory
    ids = params[:ids]
    if ids==nil || ids.size <= 0
      flash[:notice] = "请选择文章!" 
      redirect_to :controller=>'post',:action=>'index'    
    else
      if Post.destroy(params[:ids])
        flash[:notice] = "删除成功."
        redirect_to :controller=>'post',:action=>'index' 
      end
    end 
  end

  def enable
  end

  def upload
    unless request.get?
    if filename=file_upload(params[:post][:image])
       #render :text=>filename

       render :json=>filename.to_json
    end
    end
  end


end
