FactoryGirl.define do
  factory :courses_pool do
    subject                 "english"
  	start_time              Time.new(2013,12,31,6,30)
  	end_time                Time.new(2013,12,31,7,30)
    min_students_to_teach   2
  end
end
