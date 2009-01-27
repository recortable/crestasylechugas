class Clip < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  belongs_to :recipient, :class_name => 'Group'
  belongs_to :group

  named_scope :posts, :conditions => {:content_type => 'blog'}, :order => 'id desc'
  named_scope :messages, :conditions => {:content_type => 'message'}, :order => 'id desc'

  after_create :create_pendings

  def self.build(user, clip_params, doc_params = nil)
    Clip.transaction do
      document = doc_params.nil? ? nil : Document.create(doc_params)
      class_method("#{clip_params[:content_type]}_params").call
      params = clip_params.merge(clip_defaults)
      Clip.create(params)
    end
  end


  def document
    @document ||= Document.find(:first, :conditions => {:id => self.content_id})
  end

  def document?
    !document.nil?
  end

  def self.message_params
    puts "hola"
  end
  

  private
  def create_pendings
    self.recipient.users.each {|u| Pending.create :user_id => u.id, :clip_id => self.id}
  end
end
