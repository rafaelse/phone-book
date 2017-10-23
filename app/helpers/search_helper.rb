module SearchHelper

  def division_path_links (division)
    division_path = division.path
    while division = division_path.pop
      concat content_tag :a, division.name, href: '#'
      concat " &raquo; ".html_safe unless division_path.empty?
    end
  end
end
