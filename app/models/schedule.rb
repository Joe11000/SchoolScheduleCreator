class Schedule < ActiveRecord::Base
  belongs_to :school

  has_many :tcr_possibilities, dependent: :destroy
  has_many :rooms,         through: :tcr_possibilities
  has_many :teachers,      through: :tcr_possibilities
  has_many :courses_pools, through: :tcr_possibilities
end
