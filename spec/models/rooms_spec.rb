require 'spec_helper'

describe Room do

  describe "model" do
    it { should allow_mass_assignment_of(:capacity) }
    it { should allow_mass_assignment_of(:number) }

    it { should belong_to(:school) }
    it { should have_many(:teacher_course_possibilities) }
    it { should have_many(:teachers).through(:teacher_course_possibilities) }
    it { should have_many(:courses_pools).through(:teacher_course_possibilities) }

    it {should have_many(:time_requests).class_name('Timeable').dependent(:destroy) }
    it {should have_many(:special_time_available).class_name('Timeable').dependent(:destroy) }
    it {should have_many(:special_time_unavailable).class_name('Timeable').dependent(:destroy) }


  end

  describe "factory" do
    before(:all) do
      @room = FactoryGirl.build_stubbed(:room)
    end


    it "should be valid", smoke: true do
      expect(@room.valid?).to eq true
    end
  end


end
