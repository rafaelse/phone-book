module ApplicationHelper

  def link_with_icon (text = "", address = "", icon = "", attributes = {})
    attributes[:href] = address
    content_tag :a, attributes do
      concat content_tag :span, "", {class: "glyphicon #{icon}", style: "margin-right: 2px"}
      concat text
    end
  end

  def ajax_redirect_to(url)
    head 302, x_ajax_redirect_url: url
  end
end
