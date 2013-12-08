class CoursesPool < ActiveRecord::Base
  attr_accessible :subject, :start_time, :end_time, :min_students_to_teach

  belongs_to :school

  has_many :teacher_course_possibilities, dependent: :destroy
  has_many :teachers, through: :teacher_course_possibilities

  validates  :start_time, presence: true
  validates  :end_time,   presence: true
  validates  :min_students_to_teach, presence: true,
    	                               numericality: { integer_only: true,
                                                     greater_than: 0 }
end
