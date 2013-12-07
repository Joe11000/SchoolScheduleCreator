class TeacherCoursePossibility < ActiveRecord::Base
	attr_accessible :scheduled_course
  belongs_to :courses_pool
  belongs_to :teacher

  #validates :scheduled_course, acceptance: { accept: [true, false],  message: "Only true or false accepted" }

end
