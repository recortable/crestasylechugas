class CreateClips < ActiveRecord::Migration
  def self.up
    create_table :clips do |t|
      t.string 'title', :null => false
      t.string 'description', :null => false
      t.string 'content_class' 
      t.string 'content_type'
      t.references 'content'                                    # id del contenido (puede ser doc, arch, group...)
      t.references 'user', :null => false                  # el usuario que crea el clip
      t.references 'group'                                       # el grupo que crea el clip
      t.references 'recipient', :null => false           # el grupo al que va dirigido el clip
      t.string 'date', :length => 8
      t.timestamps
    end

    add_index :clips, :date
  end

  def self.down
    drop_table :clips
  end
end
