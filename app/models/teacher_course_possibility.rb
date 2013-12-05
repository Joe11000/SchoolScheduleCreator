class TeacherCoursePossibility < ActiveRecord::Base
  belongs_to :courses_pool
  belongs_to :teacher

  validates :scheduled_course, acceptance: {accept: %w(true false)},
                               message: "Only 'true' or 'false' accepted"

end
