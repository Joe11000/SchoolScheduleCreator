FactoryGirl.define do
  factory :courses_pool do
    subject                 "english"
    start_time              DateTime.now
    end_time                DateTime.now + 1.hour
    min_students_to_teach   2
  end
end
