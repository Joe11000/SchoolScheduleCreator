class Timespan < ActiveRecord::Base
  attr_accessible :start_time, :end_time

  belongs_to :timeable, polymorphic: true

  validates  :start_time, presence: true
  validates  :end_time,   presence: true
end
