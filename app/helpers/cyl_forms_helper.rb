module CylFormsHelper

  def field_help(text)
    content_tag(:p, text, :class => 'help')
  end

  def field_hidden(group, name, value)
    hidden_field_tag("#{group}[#{name}]", value)
  end

  def field_info(label, value)
    content_tag(:label, label) << content_tag(:p, value, :class => 'info') << content_tag(:br)
  end

  DEFAULT = {:validate => [], :value => ''}
  def field_area(label, group, name, options = {})
    options = options.merge(DEFAULT)
    content_tag(:label, label) << text_area_tag("#{group}[#{name}]", options[:value], :class => options[:validate].join(' ')) << content_tag(:br)
  end

  def field_text(label, group, name, options = {})
    options = DEFAULT.merge(options)
    puts "AF #{options}"
    puts "dd #{options[:value]}"
    content_tag(:label, label) << text_field_tag("#{group}[#{name}]", options[:value], :class => options[:validate].join(' ')) << content_tag(:br)
  end

  def field_boolean(label, group, name, value = true, options = {})
    content_tag(:label, label) << check_box_tag("#{group}[#{name}]", "1", value) << content_tag(:br)
  end

  def field_select(label, group, name, collection)
    content_tag(:label, label) <<  select(group.to_s, name.to_s, collection) << content_tag(:br)
  end

  def field_submit(name, id, cancel = nil)
    cancel_button = cancel.nil? ? '' : link_to('Cancelar', cancel, :class => 'button')

    content_tag(:label, '&nbsp;') << content_tag(:a, name, :href => 'javascript: void(0);',
      :onclick => "$('##{id}').valida();", :class => 'submit button') << cancel_button  << content_tag(:br)
  end

  def field_file(label, group, name)
    content_tag(:label, label) << file_field_tag("#{group}[#{name}]") << content_tag(:br)
  end

end

