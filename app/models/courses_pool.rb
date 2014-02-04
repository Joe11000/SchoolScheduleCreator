class CoursesPool < ActiveRecord::Base
  attr_accessible :subject, :min_students_to_teach, :subject_number

  belongs_to :school

  has_many :teacher_course_possibilities, dependent:  :destroy,
                                          inverse_of: :courses_pool

  has_many :teachers, through: :teacher_course_possibilities #,  source:  :teacher

  validates  :min_students_to_teach, presence: true,
    	                               numericality: { integer_only: true,
                                                     greater_than: 0 }
  validates  :subject_number, presence: true,
    	                        numericality: { integer_only: true,
                                              greater_than: 0 }
end