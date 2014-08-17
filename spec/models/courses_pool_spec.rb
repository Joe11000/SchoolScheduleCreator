require 'spec_helper'

describe CoursesPool do

  describe "factory" do
    before(:all) do
  	  @courses_pool = FactoryGirl.build_stubbed(:courses_pool)
    end

    it "is valid", smoke: true do
      expect(@courses_pool.valid?).to eq true
    end

    it "has correct subject" do
      expect(@courses_pool.subject).to eq "english"
    end

    it "has correct course number" do
      expect(@courses_pool.course_number).to eq 101
    end

    it "has correct min_students_to_teach" do
      expect(@courses_pool.min_students_to_teach).to eq 2
    end

  end

  describe "model" do

    it { should allow_mass_assignment_of(:course_number)}
    it { should allow_mass_assignment_of(:min_students_to_teach) }
    it { should allow_mass_assignment_of(:subject) }

    it { should belong_to(:school)}

    it { should validate_presence_of(:course_number) }
    it { should validate_presence_of(:min_students_to_teach) }

    it { should validate_numericality_of(:min_students_to_teach), greater_than: 0 }
    it { should validate_numericality_of(:min_students_to_teach), only_integer: true }

    it { should have_many(:teacher_course_possibilities).dependent(:destroy) }
    it { should have_many(:teachers).through(:teacher_course_possibilities) }
  end
end
