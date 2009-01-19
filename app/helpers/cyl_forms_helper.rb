module CylFormsHelper


  def field_text(label, group, name, options = {:validate => []})
    content_tag(:label, label) << text_field_tag("#{group}[#{name}]", '', :class => options[:validate].join(' ')) << content_tag(:br)
  end

  def field_submit(name, id)
    content_tag(:label, '&nbsp;') << content_tag(:a, name, :href => 'javascript: void(0);',
       :onclick => "$('##{id}').valida();", :class => 'submit button') << content_tag(:br)
  end

end

