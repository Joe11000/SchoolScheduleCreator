require 'spec_helper'

describe TcrPossibility do

	describe "factory" do
		it "is valid" do
			expect(FactoryGirl.build(:tcr_possibility)).to be_valid
		end

		# after(:all) do

  #   end
	end

	describe "model" do
		it { should allow_mass_assignment_of(:scheduled_course) }

	  it { should belong_to(:teacher) }
	  it { should belong_to(:courses_pool) }
	end

	describe "instances" do
		# before(:all) do
		# 	# @teacher = FactoryGirl.create(:teacher)
		# 	# @course = FactoryGirl.create(:courses_pool)

		# 	# @course.teachers << @teacher

		# 	# @tcr_possibility = @teacher.tcr_possibilities.first
		# end

		# after(:all) do
		# 	@teacher.destroy
		# 	@course.destroy
	# 	# end
	# after(:all) do
 #    @teacher.try(:destroy)
 #    @course.try(:destroy)
 #  end

		# it {}
	end
end
