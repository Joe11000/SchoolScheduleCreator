# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher_course_possibility, :class => 'TeacherCoursePossibilities' do
  	teacher_course_possibility
  	teacher
  	scheduled_course   false
  end
end
