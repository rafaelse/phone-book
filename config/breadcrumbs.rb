crumb :root do
  link "Início", root_path
end

crumb :search_people do |person|
  link person.name, search_people_path(person)
  parent :root
end

crumb :search_divisions do |division|
  link division.name, search_divisions_path(division)
  if division.parent_division
    parent :search_divisions, division.parent_division
  else
    parent :root
  end
end

crumb :search do |term|
  link "Busca por '#{term}'", search_path(term: term)
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).