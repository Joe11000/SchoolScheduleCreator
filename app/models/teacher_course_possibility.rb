class TeacherCoursePossibility < ActiveRecord::Base
  attr_accessible :scheduled_course

  belongs_to :courses_pool
  belongs_to :teacher

  has_one :class_time, class_name: "Timespan", as: :timeable
end
