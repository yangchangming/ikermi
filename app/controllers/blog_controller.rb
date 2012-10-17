class BlogController < ApplicationController

  layout 'blog',:except=>'unknow_request'

  def index 
    @posts = Post.find(:all,:order=>"created_at desc")  
    @recent_post = Post.find(:all,:order=>"created_at desc")    
  end

  def show 
    @recent_post = Post.find(:all,:order=>"created_at desc")    
    @post = Post.find(params[:id])
  end

  def about
    @recent_post = Post.find(:all,:order=>"created_at desc")    
  end


end
