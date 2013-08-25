class Post < ActiveRecord::Base  
	  
	has_and_belongs_to_many :tags


    validates_presence_of(:title, :message => "标题不能为空！")
    validates_presence_of(:abstract,:message=>"摘要不能为空！")
    validates_presence_of(:content,:message=>"文章内容不能为空！")
    
    validates_length_of(:title,:within=>1..100,:too_short=>"标题长度为1~100!")
    validates_length_of(:abstract,:within=>1..200,:too_short=>"摘要长度为1~200！")
    

    # just delete posts_tags record. not delete tags record
    def before_destroy
    	tags.each do |tag|
    		#tags.destroy tag    		
			ActiveRecord::Base.connection.execute("delete from posts_tags where tag_id='#{tag.id}' and post_id=#{id} ")
    	end    	
    end	


end
