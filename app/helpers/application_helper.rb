# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include CylFormsHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def flash_div(name)
     content_tag( :div, flash[name], :class => name.to_s ) if flash[name]
  end

end
