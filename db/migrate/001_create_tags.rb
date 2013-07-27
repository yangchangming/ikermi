class CreateTags < ActiveRecord::Migration
  def self.up
    create_table "tags" do |t|
      t.string "tag_name"
      t.boolean "is_valid"
      t.timestamps
    end
  end

  def self.down
    drop_table "tags"
  end
end
