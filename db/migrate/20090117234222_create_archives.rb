class CreateArchives < ActiveRecord::Migration
  def self.up
    create_table :archives do |t|
      t.string :content_type
      t.string :filename
      t.integer :size
      t.integer :width
      t.integer :height
      t.integer :parent_id
      t.string :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :archives
  end
end
