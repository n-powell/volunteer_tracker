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
      procest.save()
      expect(project.name()).to(eq("Tree Planting"))
    end
  end
end
