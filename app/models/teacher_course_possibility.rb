class TeacherCoursePossibility < ActiveRecord::Base
	attr_accessible :scheduled_course

  belongs_to :courses_pool
  belongs_to :teacher

  validates  :start_time, presence: true
  validates  :end_time,   presence: true

end
