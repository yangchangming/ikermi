class IndexController < ApplicationController
 
  layout 'application',:except=>'unknow_request' 
 
 
 #首页
  def index 
    
    render :template=>'index/index.html.erb'
  end
  
  
  #课程
  def course
    render :template=>'index/course_view.html.erb'
  end
  
  #最新新闻列表
  def news
    render :action=>'index/news.html.erb'
  end
  
     
  def project
  end
    
  def faq
  end
  
  def contact_us
    
  end
  
  def teachers
    
  end
  
  #应用所有错误请求，此action进行处理
  def unknow_request
    render :template=>'layouts/404.html.erb'
  end
  
  
  
end
