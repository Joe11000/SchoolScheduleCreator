class Teacher < ActiveRecord::Base
	attr_accessible :name, :bio, :break_time

	belongs_to :school

	# 2 below not rspeced tested yet
  has_many :teacher_course_possibilities, dependent: :destroy
  has_many :courses_pools, through: :teacher_course_possibilities


	validates :name, presence: true
  validates :bio,  presence: true
end