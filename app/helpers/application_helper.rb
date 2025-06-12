module ApplicationHelper
  def link_to_menu_item(tag, text, url = nil, options = {})
    wrapper_options = {}
    wrapper_options[:class] = 'active' if request.path.include?(url)

    content_tag tag, link_to(text, url, options), wrapper_options
  end
end
