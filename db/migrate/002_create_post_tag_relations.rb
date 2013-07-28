class CreatePostTagRelations < ActiveRecord::Migration
  def self.up
    create_table :post_tag_relations do |t|
      t.integer "post_id", :null=>false
      t.integer "tag_id",  :null=>false
      t.timestamps
    end
  end
       
  def self.down
    drop_table :post_tag_relations
  end
end