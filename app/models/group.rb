class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :clips, :foreign_key => 'recipient_id'
  named_scope :gaks, :conditions => {:gak => true}

  GROUPS = {:cyl => 1, :web => 2}


  def self.get(name)
    Group::GROUPS[name]
  end

  def messages
    Clip.find(:all, :conditions => {:content_type => 'message', :recipient_id => self.id})
  end

  def aclips
    Clip.find :all, :conditions => {:recipient_id => self.id}
  end


  def new_clip(user)
    Clip.new(:title => 'Nuevo grupo', :description => "Celebramos la creación del grupo #{self.name}",
      :content_class => 'Group', :content_type => 'group', :content_id => self.id,
      :user_id => user.id, :group_id => Group.get(:web), :recipient_id => Group.get(:web))
  end
end
