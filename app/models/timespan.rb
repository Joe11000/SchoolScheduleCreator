class Timespan < ActiveRecord::Base
	attr_accessible :start_time, :end_time

	validates  :start_time, presence: true
  validates  :end_time,   presence: true

	belongs_to :imageable, polymorphic: true

end
