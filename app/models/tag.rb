class Tag < ActiveRecord::Base

	has_and_belongs_to_many :posts
	
	validate :valid_tag_name?
	validate_on_create :unique_tag_name?

	
	private
	def valid_tag_name?

	end

	
    def unique_tag_name?
    	if Tag.find_by_tag_name(tag_name)
    		errors.add(:tag_name,"is already being used")
    		
    	end
    end	
	

end
