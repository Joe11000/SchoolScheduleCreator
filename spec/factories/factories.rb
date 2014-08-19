FactoryGirl.define do

# polymorphic factory girl associations help # https://gist.github.com/travisr/2830535

  factory :courses_pool, aliases: [:course] do
    subject             "english"
    course_code         "MAT_101"
    min_students_to_teach  2
  end

  factory :room do
    capacity 25
    sequence(:number) {|n| "#{n}" }
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
    passing_period_length 4
    # open_time
    # room

    after(:build) do |school|
      school.password              = "1234"
      school.password_confirmation = "1234"

      # school.open_times.create(start_time: Time.new(2013,12,31,6,30),
      #                          end_time: Time.new(2013,12,31,7,30))
    end
  	# association :timeable, factory: :timespan
  end
#################################################################

  factory :tcr_possibility do #, :class => 'TcrPossibility' do
    association :room, factory: :room, strategy: :build
    association :courses_pool, factory: :courses_pool, strategy: :build
    association :teacher, factory: :teacher, strategy: :build
  	scheduled_course  false

    # factory :tcr_possibility_scheduled do
    #   scheduled_course  true
    # end
  end

  factory :teacher do
    name  "Jill Teacher"
    bio   "Does the teaching thing"
  	# association :timeable, factory: :timespan
  end

  factory :timespan, aliases: [:break_time, :open_time, :occupied_time], class: "Timespan" do
  	start_time  Time.new(2013,12,31,6,30)
  	end_time    Time.new(2013,12,31,7,30)
  end
end
