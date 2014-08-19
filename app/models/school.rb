class School < ActiveRecord::Base
  attr_accessible :bio, :location, :name, :passing_period_length

  validates :bio,      presence: true
  validates :location, presence: true, uniqueness: true
  validates :name,     presence: true, uniqueness: true
  validates :password, presence: true
  validates :passing_period_length, numericality: {
                                                    integer_only: true,
                                                    greater_than_or_equal_to: 0
                                                  }


  has_many :teachers,         dependent: :destroy
  has_many :courses_pools,    dependent: :destroy
  has_many :rooms,            dependent: :destroy
  has_many :schedules,        dependent: :destroy

  has_many :tcr_possibilities, through: :schedules

  has_many  :open_times, class_name: "Timespan",
                         as: :timeable,
                         dependent: :destroy

  has_secure_password

  def self.create_all_possible_schedules

  end



  # def deleteNoLongerNeededCourses(courses)
  #   course_codes_arr = []
  #   courses.values.each do |course|
  #     course_codes_arr << course['course_code']
  #   end

  #   self.courses_pools.where("courses_pools.course_code NOT IN (?)", course_codes_arr).destroy_all
  # end
end
