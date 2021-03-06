class CoursesPool < ActiveRecord::Base

  # layout: "new_courses_layout", only: [:new, :edit]

  attr_accessible :course_code, :min_students_to_teach, :subject

  belongs_to :school

  has_many   :tcr_possibilities, dependent:  :destroy,
                                            inverse_of: :courses_pool
  has_many   :teachers, through: :tcr_possibilities #,  source:  :teacher


  validates  :min_students_to_teach, presence: true,
    	                               numericality: { integer_only: true,
                                                     greater_than: 0 }
  validates  :course_code, presence: true
end
