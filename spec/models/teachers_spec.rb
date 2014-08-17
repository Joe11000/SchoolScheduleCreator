require 'spec_helper'


# test the model methods


describe Teacher do
  describe "model" do

    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:bio) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bio) }

    it { should belong_to(:school) }

    it { should have_many(:break_times).dependent(:destroy) }
    it { should have_many(:teacher_course_possibilities).dependent(:destroy)}
    it { should have_many(:courses_could_teach).through(:teacher_course_possibilities).source(:courses_pool) }
    it { should have_many(:courses_teaching).through(:teacher_course_possibilities).source(:courses_pool)}

  end


  describe "factory" do

    before(:all) do
      @teacher = FactoryGirl.create(:teacher)
    end

    after(:all) do
      @teacher.try(:destroy)
    end

    it "is valid", smoke: true do
      expect(@teacher.new_record?).to eq false
    end

    it "has a name" do
      expect(@teacher.name).to eq "Jill Teacher"
    end

    it "has a bio" do
      expect(@teacher.bio).to eq "Does the teaching thing"
    end

  end
end
