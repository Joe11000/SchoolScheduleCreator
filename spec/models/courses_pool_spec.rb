require 'spec_helper'

describe CoursesPool do
  before(:all) do
  	@school = FactoryGirl.build(:school, name: "SchoolName_CoursesPoolsSpec")
    @school.password = "1234"
    @school.password_confirmation = "1234"
    @school.save

  	@courses_pool = FactoryGirl.create(:courses_pool)
  end

  # after(:all) do
  #   @school.destroy
  #   @courses_pool.destroy
  # end

  after(:all) do
    @school.try(:destroy)
    @courses_pool.try(:destroy)
  end

   it { should allow_mass_assignment_of(:subject) }
   it { should allow_mass_assignment_of(:min_students_to_teach) }

   it { should validate_presence_of(:min_students_to_teach) }
   it { should validate_presence_of(:subject_number) }

   it { should validate_numericality_of(:min_students_to_teach), greater_than: 0 }
   it { should validate_numericality_of(:subject_number),        greater_than: 0 }

   it { should validate_numericality_of(:min_students_to_teach), only_integer: true }
   it { should validate_numericality_of(:subject_number),        only_integer: true }

   it { should have_many(:teacher_course_possibilities).dependent(:destroy) }
   it { should have_many(:teachers).through(:teacher_course_possibilities) }
end
