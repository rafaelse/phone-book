module ApplicationHelper

  def display_division_tree (division)
    content_tag("div", construct_tree(division), class: 'tree')
  end

  def link_with_icon (text = "", address = "", icon = "", attributes = {})
    attributes[:href] = address
    content_tag :a, attributes do
      concat content_tag :span,   "",{class: "glyphicon #{icon}", style: "margin-right: 2px"}
      concat text
    end
  end

  def user_signed_in?
    !session[:user_id].nil?
  end

  def current_user
    if user_signed_in?
      User.find(session[:user_id])
    end
  end
end
