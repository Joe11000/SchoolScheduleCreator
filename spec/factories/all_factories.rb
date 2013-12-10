FactoryGirl.define do

  factory :courses_pool do
    subject                 "english"
    min_students_to_teach   2
  end

  factory :room do
    association :timeable, factory: :timespan
  	capacity  25
  	number    1
  end

  factory :school do
  	name                  "SchoolA"
  	location              "32124.12345 886.4366743256"
  	bio                   "Opened Last Thursday."
  	password              1234
  	password_confirmation 1234
  	association :timeable, factory: :timespan
  end

  factory :teacher_course_possibility do #, :class => 'TeacherCoursePossibilities' do
  	teacher
  	scheduled_course   false
  end

  factory :teacher do
    name       "Jill Teacher"
    bio        "Does the teaching thing"
  	association :timeable, factory: :timespan
  end

  factory :timespan, aliases: [:break_time, :time_open, :occupied_time], class: "Timespan" do
  	start_time    Time.new(2013,12,31,6,30)
  	end_time      Time.new(2013,12,31,7,30)
  end
end