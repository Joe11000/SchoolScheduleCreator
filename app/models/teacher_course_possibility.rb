class TeacherCoursePossibility < ActiveRecord::Base
	attr_accessible :scheduled_course

  belongs_to :courses_pool
  belongs_to :teacher
  #has_one    :room
end
