require 'spec_helper'

describe Room do
  before(:all) do
  	@teacher = FactoryGirl.create(:teacher, name: "TeachNAMEZZ")
  	@course = FactoryGirl.create(:courses_pool)

  	@course.teachers << @teacher

  	@teacher_course_possibility = @teacher.teacher_course_possibilities.first
  	@school = FactoryGirl.create(:school, name: "Joez Schoolzz")

  	@room.school = @school
  	@room.teacher_course_possibilities << @teacher_course_possibility
  end

  # after(:all) do
  # 	@room.destroy
  # 	@school.destroy
  # 	@teacher.destroy
  # 	@course.destroy
  # end

  after(:all) do
    @room.try(:destroy)
    @school.try(:destroy)
    @teacher.try(:destroy)
    @course.try(:destroy)
  end

  # expect(FactoryGirl.create(:room)).to be_valid
end
