Refinery::Pages::SectionPresenter.class_eval do
  attr_accessor :view_context
  #def wrap_content_in_tag(content)
    #template = ERB.new content.to_s.gsub("&gt;",'>').gsub("&lt;",'<')
    #def view_context.get_binding
      #binding()
    #end
    #content = template.result(view_context.get_binding).html_safe
    #content_tag(:section, content_tag(:div, content , :class => 'inner'), :id => id)
  #end
  def wrap_content_in_tag(content)
    PageCell::Template.new {content}.render(view_context)
  end
end


Refinery::Pages::ContentPagesHelper.class_eval do
  def render_content_page(page, options = {})
    content_page_presenter = Refinery::Pages::ContentPagePresenter.new(page, page_title)
    content_page_presenter.view_context = self
    render_content_presenter(content_page_presenter, options)
  end
end

Refinery::Pages::ContentPresenter.class_eval do
  attr_accessor :view_context
  def sections_html(can_use_fallback)
    @sections.map do |section|
      # Remove in 2.1
      bind_view_context(section)
      check_deprecated_sections(section)
      section.wrapped_html(can_use_fallback)
    end.compact.join("\n").html_safe
  end

def bind_view_context(section)
  section.view_context = self.view_context
end
end

