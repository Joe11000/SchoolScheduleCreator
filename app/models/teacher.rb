class Teacher < ActiveRecord::Base
	attr_accessible :name, :bio

	belongs_to :school

  has_many :break_times, as: :timeable, dependent: :destroy
  has_many :teacher_course_possibilities, dependent: :destroy
  has_many :courses_pools, through: :teacher_course_possibilities

	validates :name, presence: true
  validates :bio,  presence: true
end