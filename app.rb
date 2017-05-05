require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require "./lib/volunteer.rb"
require("pg")
require("pry")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get("/") do
  @projects = Project.all()
  @volunteers = Volunteer.all()
  erb(:index)
end

get("/projects/new") do
  erb(:project_form)
end

post("/projects") do
  name = params.fetch("project_name")
  project = Project.new({:name => name, :id => nil})
  project.save()
  erb(:success)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get("/projects/:id") do
  # @list_id = params.fetch("id").to_i()
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

post("/volunteers") do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:name => name, :project_id => project_id})
  @volunteer.save()
  erb(:success)
end
