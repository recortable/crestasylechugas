class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'Group'

  named_scope :posts, :conditions => {:content_type => 'blog'}, :order => 'id desc'
  named_scope :messages, :conditions => {:content_type => 'message'}, :order => 'id desc'

  after_save :create_pendings

  def document
    @document ||= Document.find(:first, :conditions => {:id => self.content_id})
  end

  private
  def create_pendings
    self.recipient.users.each {|u| Pending.create :user_id => u.id, :clip_id => self.id}
  end
end
