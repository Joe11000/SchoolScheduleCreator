FactoryGirl.define do
  factory :courses_pool do
    subject                "english"
    time_start              DateTime.now
    time_end                DateTime.now + 1.hour
    min_students_to_teach   2
  end
end
