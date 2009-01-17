class CreateClips < ActiveRecord::Migration
  def self.up
    create_table :clips do |t|
      t.string 'title'
      t.string 'description'
      t.references 'user'
      t.timestamps
    end
  end

  def self.down
    drop_table :clips
  end
end
