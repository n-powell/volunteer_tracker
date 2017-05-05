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
      project_is = volunteer.fetch("project_id")
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    volunteers
  end
end
