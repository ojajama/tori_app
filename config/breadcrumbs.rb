crumb :root do
  link "Home", root_path
end

crumb :words do
   link "尻取り一覧", words_path
end

crumb :youreis do |yourei|
   link "用例一覧", youreis_path(yourei)
   parent :words
end

crumb :yourei do |yourei|
   link "用例", words_path
   parent :youreis
end

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
