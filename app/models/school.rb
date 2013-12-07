class School < ActiveRecord::Base
	has_secure_password
	has_many :teachers
	has_many :courses_pools, dependent: :destroy

	attr_accessible :name, :bio, :location

	validates :name,     presence: true, uniqueness: true
  validates :bio,      presence: true
  validates :location, presence: true
  validates :password, presence: true
end
