class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, :class_name => 'Group'

  named_scope :posts, :conditions => {:content_type => 'blog'}
end
