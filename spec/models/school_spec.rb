require 'spec_helper'

describe School do
	before(:all) do
		@school = FactoryGirl.build(:school)
		@school.password              = "1234"
		@school.password_confirmation = "1234"
    @school.save()

    @teacher = FactoryGirl.create(:teacher)
     @school.teachers << @teacher
	end

  it "has a name" do
  	expect(@school.name).to eq "SchoolA"
  end

  it "has a location" do
		expect(@school.location).to eq "32124.12345 886.4366743256"
  end

  it "has a password" do
		expect(@school.authenticate('1234')).to be_true
  end

  it "has a bio" do
  	expect(@school.bio).to eq "Opened Last Thursday."
  end

  it { should have_secure_password }
  it { should allow_mass_assignment_of(:bio) }
  it { should allow_mass_assignment_of(:location) }
  it { should allow_mass_assignment_of(:name) }
  it { should_not allow_mass_assignment_of(:password) }

  it { should have_many(:teachers) }
  it { should have_many(:courses_pools) }

end
