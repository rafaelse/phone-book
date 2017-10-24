module SearchHelper

  def division_path_links (division)
    if division
      division_path = division.path
      while division = division_path.shift
        concat content_tag :a, division.name, href: search_divisions_path(division)
        concat " &raquo; ".html_safe unless division_path.empty?
      end
    end
  end
end
