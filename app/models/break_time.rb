class BreakTime < ActiveRecord::Base
	attr_accessible :start_time, :end_time, :confirmed


	belongs_to :teacher

	validates  :start_time, presence: true
  validates  :end_time,   presence: true
end
