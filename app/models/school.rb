class School < ActiveRecord::Base
  attr_accessible :bio, :location, :name

  validates :bio,      presence: true
  validates :location, presence: true, uniqueness: true
  validates :name,     presence: true, uniqueness: true
  validates :password, presence: true

  has_many :teachers,         dependent: :destroy
  has_many :courses_pools,    dependent: :destroy
  has_many :rooms,            dependent: :destroy

  has_many :tcr_possibilities, through: :courses_pools

  has_one  :time_open, class_name: "Timespan",
                       as: :timeable,
                       dependent: :destroy

  has_secure_password

  def deleteNoLongerNeededCourses(courses)
    course_codes_arr = []
    courses.values.each do |course|
      course_codes_arr << course['course_code']
    end

    self.courses_pools.where("courses_pools.course_code NOT IN (?)", course_codes_arr).destroy_all
  end
end
