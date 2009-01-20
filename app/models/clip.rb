class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'Group'

  named_scope :posts, :conditions => {:content_type => 'blog'}, :order => 'id desc'
  named_scope :messages, :conditions => {:content_type => 'message'}, :order => 'id desc'

  def document
    @document ||= Document.find(self.content_id)
  end
end
