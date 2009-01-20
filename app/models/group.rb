class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  named_scope :gaks, :conditions => {:gak => true}
  
end
