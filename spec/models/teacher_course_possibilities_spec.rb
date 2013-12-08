require 'spec_helper'

describe TeacherCoursePossibility do
  it { should belong_to(:teacher) }
  it { should belong_to(:courses_pool) }
	it { should allow_mass_assignment_of(:scheduled_course) }
end
