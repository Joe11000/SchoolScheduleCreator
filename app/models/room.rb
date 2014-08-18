class Room < ActiveRecord::Base
	attr_accessible :capacity, :number

  belongs_to :school

  has_many :tcr_possibilities
  has_many :teachers, through: :tcr_possibilities
  has_many :courses_pools, through: :tcr_possibilities

  has_many :time_requests,                 as: :timeable, class_name: 'Timespan', dependent: :destroy
  has_many :special_time_availibilities,   as: :timeable, class_name: 'Timespan', dependent: :destroy
  has_many :special_time_unavailibilities, as: :timeable, class_name: 'Timespan', dependent: :destroy

  validates :capacity, presence: true,
                       numericality: { integer_only: true,
                                       greater_than: 0 }
  validates :number, presence: true,
                     uniqueness: true,
                     numericality: { integer_only: true,
                                     greater_than_or_equal_to: 0}

end
