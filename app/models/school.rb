class School < ActiveRecord::Base
	has_secure_password

	attr_accessible :name, :bio, :location

	# validates :name,     presence: true, uniqueness: true
 #  validates :bio,      presence: true
 #  validates :location, presence: true
 #  validates :password, presence: true
end
