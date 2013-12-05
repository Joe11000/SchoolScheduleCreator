require 'spec_helper'

describe Teacher do
	before(:all) do
    @teacher = FactoryGirl.create(:teacher)
	end

  it "has a name" do
  	expect(@teacher.name).to eq "Jill Teacher"
  end

  it "has a bio" do
  	expect(@teacher.bio).to eq "Does the teaching thing"
  end

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:bio) }
  it { should allow_mass_assignment_of(:break_time) }
  it { should belong_to(:school) }
end