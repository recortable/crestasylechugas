module CylFormsHelper

  def field_info(label, value)
    content_tag(:label, label) << content_tag(:p, value, :class => 'info') << content_tag(:br)
  end

  def field_area(label, group, name)
    content_tag(:label, label) << text_area_tag("#{group}[#{name}]") << content_tag(:br)
  end

  def field_text(label, group, name, options = {:validate => []})
    content_tag(:label, label) << text_field_tag("#{group}[#{name}]", '', :class => options[:validate].join(' ')) << content_tag(:br)
  end

  def field_boolean(label, group, name, value = true, options = {})
    content_tag(:label, label) << check_box_tag("#{group}[#{name}]", "1", value) << content_tag(:br)
  end

  def field_select(label, group, name, collection)
    content_tag(:label, label) <<  select(group.to_s, name.to_s, collection) << content_tag(:br)
  end

  def field_submit(name, id)
    content_tag(:label, '&nbsp;') << content_tag(:a, name, :href => 'javascript: void(0);',
      :onclick => "$('##{id}').valida();", :class => 'submit button') << content_tag(:br)
  end

end

