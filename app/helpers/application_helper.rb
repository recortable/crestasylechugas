# Methods added to this helper will be available to all templates in the
# application.
module ApplicationHelper
  include CylFormsHelper
  include MonthlyHelper

  def cyl(action)
    {:controller => 'cyl', :action => action.to_s}
  end

  def div_unless(condition, &block)
    concat( content_tag(:div, capture(&block), :class => 'admin'), block.binding) unless condition
  end

  def div_if(condition, &block)
    concat( content_tag(:div, capture(&block), :class => 'admin'), block.binding) if condition
  end

  def user_area(&block)
    if !@current.nil?
      concat content_tag(:div, capture(&block), :class => 'user'), block.binding
    end
  end

  def admin_area(&block)
    if !@current.nil? && @current.admin?
      concat capture(&block), block.binding
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def clip_info(clip)
    render :partial => '/clips/info.rhtml.erb', :object => clip
  end

  def clip_infoOLD(clip)
    content_tag( :p, content_tag( :label, 'publicado ') <<  fecha(clip.created_at) ) <<
      content_tag(:p, content_tag(:label, 'de ' ) << link_to(clip.user.name, clip.user) <<
        content_tag(:p, content_tag(:label, 'desde ') << link_to()) <<
        content_tag(:label, ' para ') << link_to(clip.recipient.name, clip.recipient) )
  end

  def flash_div(name)
    content_tag( :div, flash[name], :class => name.to_s ) if flash[name]
  end

  def fecha(date)
    date.strftime("%d/%m/%Y")
  end

  DIAS = %w(domingo lunes martes miércoles jueves viernes sábado)
  def day_of(date)
    DIAS[date.wday]
  end

  def ucolor
    session[:color].nil? ? '#58DF37' : session[:color]
  end
end
