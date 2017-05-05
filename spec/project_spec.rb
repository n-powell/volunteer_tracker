require("spec_helper")

describe("Project") do
  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the project name") do
      project = Project.new({:name => "Tree Planting", :id => nil})
      expect(project.name()).to(eq("Tree Planting"))
    end
  end

  describe("#id") do
    it("tells you the project id") do
      project = Project.new({:name => "Tree Planting", :id => 2})
      expect(project.id()).to(eq(2))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Project.new({:name => "Tree Planting", :id => nil})
      project2 = Project.new({:name => "Tree Planting", :id => nil})
      expect(project1).to(eq(project2))
    end
  end

  describe("#save") do
    it("tells you save the project to the database") do
      project = Project.new({:name => "Tree Planting", :id => nil})
      project.save()
      expect(project.name()).to(eq("Tree Planting"))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      test_project = Project.new({:name => "Garbage Pickup", :id => nil})
      test_project.save()
      test_project2 = Project.new({:name => "Tree Planting", :id => nil})
      test_project2.save()
      expect(Project.find(test_project2.id())).to(eq(test_project2))
    end
  end

  describe("#volunteers") do
    it("returns an array of volunteers for that project") do
      project = Project.new({:name => "Garbage Pickup", :id => nil})
      project.save()
      volunteer1 = Volunteer.new({:name => "Kyle", :id => 2, :project_id => project.id()})
      volunteer1.save()
      volunteer2 = Volunteer.new({:name => "Kyle", :id => 1, :project_id => project.id()})
      volunteer2.save()
      expect(project.volunteers(project.id)).to(eq([volunteer1, volunteer2]))
    end
  end

  describe("#update") do
    it("lets you update project in the database") do
      project = Project.new({:name => "Sweeping", :id => nil})
      project.save()
      project.update({:name => "Sweeping the garage"})
      expect(project.name()).to(eq("Sweeping the garage"))
    end
  end

  describe("#delete") do
  it("lets you delete a project from the database") do
    project = Project.new({:name => "Sweeping", :id => nil})
    project.save()
    expect(Project.all()).to(eq([]))
  end
end
end
