class CoursesPool < ActiveRecord::Base
  attr_accessible :subject, :time_start, :time_end, :min_students_to_teach

  belongs_to :school

  # 2 below not rspeced tested yet
  has_many :teacher_course_possibilities
  has_many :teachers, through: :teacher_course_possibilities


  validates  :time_start, presence: true
  validates  :time_end,   presence: true
  validates  :min_students_to_teach, presence: true,
    	                               numericality: { integer_only: true,
                                                     greater_than: 0}
end
