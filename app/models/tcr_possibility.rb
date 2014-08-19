class TcrPossibility < ActiveRecord::Base
  attr_accessible :scheduled_course

  belongs_to :courses_pool, inverse_of: :tcr_possibilities
  belongs_to :teacher, inverse_of: :tcr_possibilities
  belongs_to :room, inverse_of: :tcr_possibilities


  has_one :course_time, class_name: "Timespan",
                        as: :timeable,
                        dependent: :destroy
end
