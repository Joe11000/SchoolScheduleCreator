class TeacherCoursePossibility < ActiveRecord::Base
  attr_accessible :scheduled_course

  belongs_to :courses_pool, inverse_of: :teacher_course_possibilities
  belongs_to :teacher, inverse_of: :teacher_course_possibilities


  has_one :course_time, class_name: "Timespan",
                       as: :timeable
end
