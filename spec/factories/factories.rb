FactoryGirl.define do

  factory :courses_pool, aliases: [:course] do
    subject                 "english"
    subject_number          101
    min_students_to_teach   2
  end

  factory :room do
    capacity  25
    number    1
    # association :timeable, factory: :timespan
  end


################################################################
    # same as location, just different way of doing it
    sequence :name do  |n|
      "School#{n}"
    end

    sequence :location do  |n|
       "#{n}.12345 #{n}.4366743256"
    end

  factory :school do
  	name
    location
  	bio                   "Opened Last Thursday."
  	# association :timeable, factory: :timespan
  end
#################################################################

  factory :teacher_course_possibility do #, :class => 'TeacherCoursePossibilities' do
    course
  	teacher
  	scheduled_course   false
  end

  factory :teacher do
    name       "Jill Teacher"
    bio        "Does the teaching thing"
  	# association :timeable, factory: :timespan
  end

  factory :timespan, aliases: [:break_time, :time_open, :occupied_time], class: "Timespan" do
  	start_time    Time.new(2013,12,31,6,30)
  	end_time      Time.new(2013,12,31,7,30)
  end
end