class CreateClips < ActiveRecord::Migration
  def self.up
    create_table :clips do |t|
      t.string 'title', :null => false
      t.string 'description', :null => false
      t.string 'content_class' 
      t.string 'content_type'
      t.references 'content' 
      t.references 'recipient', :null => false
      t.references 'user', :null => false
      t.timestamp 'date'
      t.timestamps
    end
  end

  def self.down
    drop_table :clips
  end
end
