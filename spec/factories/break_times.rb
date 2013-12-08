# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :break_time do
  	start_time  Time.new(2013,12,31,6,30)
  	end_time    Time.new(2013,12,31,7,30)
  	confirmed   false
  end
end
