# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
     name       "Jill Teacher"
     break_time  nil
     bio        "Does the teaching thing"
  end
end
