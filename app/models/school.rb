class School < ActiveRecord::Base
	has_secure_password

	allow_mass_assignment_of()

	# validates :name,     presence: true, uniqueness: true
 #  validates :bio,      presence: true
 #  validates :location, presence: true
 #  validates :password, presence: true
end
