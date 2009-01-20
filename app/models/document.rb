class Document < ActiveRecord::Base
  DIALECTS = [:plain, :html, :textile]

  def new_clip(title, type, user, recipient_id)
      Clip.create(:title => title, :description => summary, :content_class => 'Document',
        :content_type => type, :recipient_id => recipient_id, :user_id => user.id, :content_id => self.id )
  end

  def summary
    "<h1>#{title}</h1>#{body}"
  end
end
