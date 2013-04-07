Refinery::Pages::SectionPresenter.class_eval do
  def wrap_content_in_tag(content)
    template = ERB.new content.to_s.gsub("&gt;",'>').gsub("&lt;",'<')
    content = template.result(binding).html_safe
    content_tag(:section, content_tag(:div, content , :class => 'inner'), :id => id)
  end
end

