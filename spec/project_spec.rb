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
end
