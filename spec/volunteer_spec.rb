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

  describe("#id") do
    it("tells you the volunteer id") do
      volunteer = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      expect(volunteer.project_id()).to(eq(2))
    end
  end

  describe("#id") do
    it("tells you the volunteer id") do
      volunteer = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      expect(volunteer.project_id()).to(eq(2))
    end
  end

  describe("#==") do
    it("is the same volunteer if it has the same name") do
      volunteer1 = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      volunteer2 = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      expect(volunteer1).to(eq(volunteer2))
    end
  end

  describe("#save") do
    it("tells you save the volunteer to the database") do
      volunteer = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      volunteer.save()
      expect(volunteer.name()).to(eq("Kyle"))
    end
  end

  describe("#save") do
    it("tells you save the volunteer to the database") do
      volunteer = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      volunteer.save()
      expect(volunteer.project_id()).to(eq(2))
    end
  end

  describe("#save") do
    it("tells you save the volunteer to the database") do
      volunteer = Volunteer.new({:name => "Kyle", :id => nil, :project_id => 2})
      volunteer.save()
      expect(volunteer.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
