require 'spec_helper'

describe CoursesPool do
  before(:all) do
  	@school = FactoryGirl.create(:school)
  	@courses_pool = FactoryGirl.create(:courses_pool)
  end

  after(:all) do
    @school.try(:destroy)
    @courses_pool.try(:destroy)
  end

   it { should allow_mass_assignment_of(:subject) }
   it { should allow_mass_assignment_of(:min_students_to_teach) }

   it { should validate_presence_of(:min_students_to_teach) }
   it { should validate_presence_of(:course_number) }

   it { should validate_numericality_of(:min_students_to_teach), greater_than: 0 }

   it { should validate_numericality_of(:min_students_to_teach), only_integer: true }

   it { should have_many(:teacher_course_possibilities).dependent(:destroy) }
   it { should have_many(:teachers).through(:teacher_course_possibilities) }
end
