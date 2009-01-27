class Document < ActiveRecord::Base
  DIALECTS = [:textile, :plain, :html]

  has_attached_file :file
  belongs_to :parent, :class_name => 'Document'
  has_many :children, :foreign_key => 'parent_id', :class_name => 'Document'

  def clip
    @clip ||= Clip.find(:first, :conditions => {:content_class => 'Document', :content_id => self.id})
  end

  def clip?
    !clip.nil?
  end

  def summary
    "<h1>#{title}</h1>#{body}"
  end
end
