class BlogController < ApplicationController

  layout 'blog',:except=>'unknow_request'

  def index 
    @posts = Post.find(:all,:order=>"updated_at desc")  
    @recent_post = Post.find(:all,:order=>"created_at desc",:limit=>10) 
       
  end


  def show 
    @recent_post = Post.find(:all,:order=>"created_at desc")    
    @post = Post.find(params[:id])
    render :layout => 'post_detail'
  end

  def about
    @recent_post = Post.find(:all,:order=>"created_at desc")    
  end
  

end
