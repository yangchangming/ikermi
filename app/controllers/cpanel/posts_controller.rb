class Cpanel::PostsController < CpanelController

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

    respond_to do |format|
      format.html {redirect_to cpanel_posts_path,:notice => '创建成功'}
      format.json
    end
  end

  def update
    #@tags = Tag.update(params[:tags])
    # TODO tag暂不支持更新

    id = params[:post][:id]
    post = Post.find(id)
    if post.update_attributes(params[:post])
      flash[:notice] = "更新成功."
      redirect_to cpanel_posts_path
    else
      #render :action=>edit
    end

  end

  def edit
    id = params[:id]
    if id==nil || id.size <= 0
      flash[:notice] = "请选择一篇文章!"
      redirect_to :controller=>'cpanel/posts',:action=>'index'
    else
      @post = Post.find(params[:id])
    end
  end

  def destory
    id = params[:id]
    if id==nil || id.size <= 0
      flash[:notice] = "请选择文章!"
      redirect_to :controller=>'cpanel/posts',:action=>'index'
    else
      if Post.destroy(params[:id])
        flash[:notice] = "删除成功."
        redirect_to :controller=>'cpanel/posts',:action=>'index'
      end
    end
  end

  def upload
    unless request.get?
      if filename=file_upload(params[:post][:image])
        render :text=>"#{RAILS_ROOT}/public/upload/images/" + filename.to_s
      end
    end
  end

end