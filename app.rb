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


get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/volunteers') do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

get("/volunteers/:id") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

get("/volunteers/:id/edit") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer_edit)
end

post("/projects") do
  name = params.fetch("project_name")
  project = Project.new({:name => name, :id => nil})
  project.save()
  erb(:success)
end

post("/volunteers") do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:id => nil, :name => name, :project_id => project_id})
  @volunteer.save()
  erb(:success)
end

patch("/volunteers/:id") do
  name = params.fetch("volunteer_name")
  project_id = params.fetch("project_id").to_i()
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.update({:name => name, :project_id => project_id})
  @message = "Succesfully changed volunteer data."
  @volunteers = Volunteer.all()
  erb(:volunteer)
end

patch("/projects/:id") do
  project_name = params.fetch("project_name")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:name => project_name})
  @message = "Succesfully changed project data."
  @projects = Project.all()
  erb(:projects)
end

delete("/volunteers/:id") do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.delete()
  @volunteers = Volunteer.all()
  erb(:volunteer)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end
