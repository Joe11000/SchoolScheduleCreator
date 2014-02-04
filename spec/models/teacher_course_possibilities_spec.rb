require 'spec_helper'

describe TeacherCoursePossibility do

	describe "factory" do
		it "is valid" do
			FactoryGirl.build(:courses_pool).should be_valid
		end

		after(:all) do

    end
	end

	describe "instances" do
		before(:all) do
			@teacher = FactoryGirl.create(:teacher)
			@course = FactoryGirl.create(:courses_pool)

			@course.teachers << @teacher

			@teacher_course_possibility = @teacher.teacher_course_possibilities.first
		end

		# after(:all) do
		# 	@teacher.destroy
		# 	@course.destroy
		# end
	after(:all) do
    @teacher.try(:destroy)
    @course.try(:destroy)
  end

		it {}
  it { should belong_to(:teacher) }
  it { should belong_to(:courses_pool) }
	it { should allow_mass_assignment_of(:scheduled_course) }
	end
end
