class Project
  attr_accessor(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      name = project.fetch("name")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:id => id, :name => name}))
    end
    projects
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end


  define_method(:==) do |another_project|
    self.name().==(another_project.name()).&(self.id().==(another_project.id()))
  end


  define_singleton_method(:find) do |id|
    found_project = nil
    Project.all().each() do |project|
      if project.id().==(id)
        found_project = project
      end
    end
      found_project
  end


  define_method(:volunteers) do |id|
    found_volunteers = []
    Volunteer.all().each() do |volunteer|
      if volunteer.project_id().==(id)
        found_volunteers.push(volunteer)
      end
    end
    found_volunteers
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
  end


end
