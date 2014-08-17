class CoursesPool < ActiveRecord::Base

  # layout: "new_courses_layout", only: [:new, :edit]

  attr_accessible :course_number, :min_students_to_teach, :subject

  belongs_to :school

  has_many   :teacher_course_possibilities, dependent:  :destroy,
                                            inverse_of: :courses_pool
  has_many   :teachers, through: :teacher_course_possibilities #,  source:  :teacher


  validates  :min_students_to_teach, presence: true,
    	                               numericality: { integer_only: true,
                                                     greater_than: 0 }
  validates  :course_number, presence: true, numericality: { integer_only: true,greater_than: 0 }
end
