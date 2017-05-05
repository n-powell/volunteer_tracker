class Volunteer
  attr_accessor(:id, :name, :project_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i()
      project_id = volunteer.fetch("project_id")
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    volunteers
  end

  define_method(:==) do |another_project|
    self.name().==(another_project.name()).&(self.id().==(another_project.id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id().==(id)
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end
end
