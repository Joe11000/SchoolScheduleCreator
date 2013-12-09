require 'spec_helper'

describe CoursesPool do
  before(:all) do
  	@school = FactoryGirl.create(:school, name: "SchoolName_CoursesPoolsSpec")
  	@courses_pool = FactoryGirl.create(:courses_pool)
  end

   it { should allow_mass_assignment_of(:subject) }
   it { should allow_mass_assignment_of(:start_time) }
   it { should allow_mass_assignment_of(:end_time) }
   it { should allow_mass_assignment_of(:min_students_to_teach) }

   it { should validate_presence_of(:min_students_to_teach) }
   it { should validate_numericality_of(:min_students_to_teach), greater_than: 0 }
   it { should validate_numericality_of(:min_students_to_teach), only_integer: true }

   it { should have_many(:teacher_course_possibilities).dependent(:destroy) }
   it { should have_many(:teachers).through(:teacher_course_possibilities) }


  after(:all) do
    @school.destroy
    @courses_pool.destroy
  end
end
