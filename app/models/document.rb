class Document < ActiveRecord::Base
  DIALECTS = [:textile, :plain, :html]

  def new_clip(title, type, user, recipient_id, date = nil)
    desc = type == 'event' ? "<h1>#{self.title}</h1>" : self.summary
    Clip.create(:title => title, :description => desc, :content_class => 'Document',
      :content_type => type, :recipient_id => recipient_id, :user_id => user.id,
      :content_id => self.id, :date => date )
  end

  def summary
    "<h1>#{title}</h1>#{body}"
  end
end
