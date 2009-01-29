class Document < ActiveRecord::Base
  DIALECTS = [:textile, :plain, :html]

  has_attached_file :file
  attr_protected :file_file_name, :file_content_type, :file_size
  validates_attachment_size :file, :less_than => 1.megabytes

  belongs_to :parent, :class_name => 'Document'
  has_many :children, :foreign_key => 'parent_id', :class_name => 'Document'

  def clip
    @clip ||= Clip.find(:first, :conditions => {:content_class => 'Document', :content_id => self.id})
  end

  def render
    if dialect == 'textile'
      textilize body
    elsif
      body
    end
  end

  def clip?
    !clip.nil?
  end

  def summary
    "<h1>#{title}</h1>#{body}"
  end

  private
  def textilize(text)
    if text.blank?
      ""
    else
      textilized = RedCloth.new(text, [ :hard_breaks ])
      textilized.hard_breaks = true if textilized.respond_to?(:hard_breaks=)
      textilized.to_html
    end
  end

end
