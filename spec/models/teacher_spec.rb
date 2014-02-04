require 'spec_helper'

describe Teacher do
  describe "factory" do
    it "is valid" do
      expect(FactoryGirl.create(:teacher)).to be_valid
    end
  end

  describe "instance" do
    before(:all) do
      @teacher = FactoryGirl.create(:teacher)
    end
  
    after(:all) do
      @teacher.try(:destroy)
    end
    # after(:all) do
    #   @teacher.destroy
    # end
  
    it "has a name" do
      expect(@teacher.name).to eq "Jill Teacher"
    end
  
    it "has a bio" do
      expect(@teacher.bio).to eq "Does the teaching thing"
    end
  
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:bio) }
  
    it { should belong_to(:school) }

    it { should have_many(:break_times).dependent(:destroy) }
    it { should have_many(:teacher_course_possibilities).dependent(:destroy) }
    it { should have_many(:courses_could_teach).through(:teacher_course_possibilities).source(:courses_pool) }
  end
end