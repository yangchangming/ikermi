class Post < ActiveRecord::Base
    
    validates_presence_of(:title, :message => "标题不能为空！")
    validates_presence_of(:abstract,:message=>"摘要不能为空！")
    validates_presence_of(:content,:message=>"文章内容不能为空！")
    
    validates_length_of(:title,:within=>1..100,:too_short=>"标题长度为1~100!")
    validates_length_of(:abstract,:within=>1..200,:too_short=>"摘要长度为1~200！")
    
end
