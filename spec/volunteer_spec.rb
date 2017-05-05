require("spec_helper")

describe("Volunteer") do
  describe(".all") do
    it("starts off with no volunteer") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the volunteer name") do
      volunteer = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      expect(volunteer.name()).to(eq("Kyle"))
    end
  end
end
