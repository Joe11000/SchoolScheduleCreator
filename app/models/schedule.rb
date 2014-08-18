class Schedule < ActiveRecord::Base
  has_many :tcr_possibilities
  has_many :rooms,         through: :tcr_possibilities, dependent: :destroy
  has_many :teachers,      through: :tcr_possibilities, dependent: :destroy
  has_many :courses_pools, through: :tcr_possibilities, dependent: :destroy
end
