class Clip < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  belongs_to :recipient, :class_name => 'Group'
  belongs_to :group
  
  belongs_to :responsed, :class_name => 'Clip'
  has_one :response, :foreign_key => 'responsed_id', :class_name => 'Clip'

  named_scope :posts, :conditions => {:content_type => 'blog'}, :order => 'id desc'
  named_scope :messages, :conditions => {:content_type => 'message'}, :order => 'id desc'

  after_create :create_pendings

  def document
    @document ||= Document.find(:first, :conditions => {:id => self.content_id})
  end

  def document?
    !document.nil?
  end

  private
  def create_pendings
    self.recipient.users.each {|u| Pending.create :user_id => u.id, :clip_id => self.id}
  end
end
