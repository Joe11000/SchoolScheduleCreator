class Room < ActiveRecord::Base
	attr_accessible :capacity, :number

	validates :capacity, presence: true,
	                     numericality: { integer_only: true,
                                       greater_than: 0 }
  validates :number, presence: true,
                     uniqueness: true,
                     numericality: { integer_only: true,
                                     greater_than_or_equal_to: 0}

  belongs_to :school

  belongs_to :classes_used_by, class_name: "TeacherCoursePossibility"

  has_many :time_requests, as: :timeable, dependent: :destroy
end
