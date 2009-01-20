# Methods added to this helper will be available to all templates in the
# application.
module ApplicationHelper
  include CylFormsHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def clip_info(clip)
    content_tag( :p, content_tag( :label, 'publicado ') <<  fecha(clip.created_at) ) <<
      content_tag(:p, content_tag(:label, 'de ' ) << clip.user.name << content_tag(:label, ' para ') << clip.recipient.name)
  end

  def flash_div(name)
    content_tag( :div, flash[name], :class => name.to_s ) if flash[name]
  end

  def fecha(date)
    date.strftime("%d/%m/%Y")
  end

end
