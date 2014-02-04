require 'spec_helper'

describe School do

  context "factory" do

    before(:each) do
      @s = FactoryGirl.create(:school)
    end

    it "is valid" do
      expect(@s.valid?).to be_true
    end

    it "is saveable to db" do
      expect(@s.new_record?).to be_false
    end

    after(:all) do
      @s.try(:destroy)
    end
  end

  context "instance" do

    before(:all) do
      @school = FactoryGirl.create(:school)

      @teacher = FactoryGirl.create(:teacher)
      @school.teachers << @teacher
    end

    after(:all) do
      @school.try(:destroy)
      @teacher.try(:destroy)
    end

    it "has a name" do
      @school.name.should match(/^school\d*$/i)
    end

    it "has a location" do
      expect(@school.location).should match(/^\d*[.]\d*\s\d*[.]\d*$/)
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

    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:bio)}
    it { should validate_presence_of(:location)}
    it { should validate_presence_of(:password)}

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:location) }

    it { should have_many(:teachers) }
    it { should have_many(:courses_pools).dependent(:destroy) }

    it { should have_one(:time_open).class_name("Timespan").dependent(:destroy) }
  end
end
