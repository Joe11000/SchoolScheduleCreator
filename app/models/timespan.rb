class Timespan < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :special_availablilityy

  belongs_to :timeable, polymorphic: true

  validates  :start_time, presence: true
  validates  :end_time,   presence: true
  validates  :special_availablilityy, inclusion: {
                                                  in: %w(none available unavailable),
                                                  message: "%{value} is not 'none', 'available' or 'unavailable'"
                                                }
end

# THIS NEEDS TO EXTEND AN ACTIVERECORD::BASE CLASS THAT CONTAINS THE GENERIC TIME INFO. THIS CAN BUILD UPON THAT ONE. TIMESPAN(THE CHILD CLASS) MUST HAVE THE (BELONGS_TO: TIMABLE, POLYMORPHIC: TRUE)
