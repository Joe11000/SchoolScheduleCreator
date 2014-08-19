require 'spec_helper'

describe TcrPossibility do

	describe "factory" do
    context "is valid if" do
      it "created by default", smoke: true do
			  expect(FactoryGirl.build(:tcr_possibility)).to be_valid
      end

      context "has correct attributes" do
      	let(:tcr_possibility){ FactoryGirl.build(:tcr_possibility) }
	      it "has scheduled_course" do
				  expect(tcr_possibility.scheduled_course).to eq false
	      end
	    end
    end

	  context "is invalid if" do
	    xit "missing a any field" do
	      [:scheduled_course].each do |element|
	        expect(FactoryGirl.build(:tcr_possibility, element => nil)).not_to be_valid
        end
	    end
	  end
  end

	describe "model" do
		it { should allow_mass_assignment_of(:scheduled_course) }

	  it { should belong_to(:teacher) }
	  it { should belong_to(:courses_pool) }
	  it { should belong_to(:room) }
	  it { should have_one(:course_time).dependent(:destroy) }
	end


  it "test instance methods"
end
