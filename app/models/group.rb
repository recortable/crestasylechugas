class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  named_scope :gaks, :conditions => {:gak => true}

  GROUPS = {:cyl => 1, :web => 2}


  def self.get(name)
    Group::GROUPS[name]
  end

  def new_clip(user)
    Clip.new(:title => 'Nuevo grupo', :description => "Celebramos la creación del grupo #{self.name}",
      :content_class => 'Group', :content_type => 'group', :content_id => self.id,
      :user_id => user.id, :recipient_id => Group.get(:web))
  end
end
