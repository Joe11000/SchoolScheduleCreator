require 'spec_helper'

describe School do

  context "factory" do
    subject(:school){ FactoryGirl.create(:school) }

    it "is valid" do
      expect(school.valid?).to eq true
    end

    it "is saveable to db", smoke: true do
      expect(school.new_record?).to eq false
    end
  end

  context "model" do
    it { should have_secure_password }

    it { should allow_mass_assignment_of(:bio) }
    it { should validate_presence_of(:bio) }

    it { should allow_mass_assignment_of(:location) }
    it { should validate_presence_of(:location) }
    it { should validate_uniqueness_of(:location) }

    it { should allow_mass_assignment_of(:name) }
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name) }

    it { should_not allow_mass_assignment_of(:password) }
    it { should validate_presence_of(:password) }

    it { should have_many(:teachers).dependent(:destroy) }
    it { should have_many(:courses_pools).dependent(:destroy) }
    it { should have_many(:rooms).dependent(:destroy) }
    it { should have_one(:time_open).class_name("Timespan").dependent(:destroy) }
  end


  context "instance" do

    subject(:school) {FactoryGirl.create(:school)}

    it "has correct name" do
      expect(school.name).to match(/^school\d*$/i)
    end

    it "has correct location" do
      expect(school.location).to match(/^\d*[.]\d*\s\d*[.]\d*$/)
    end

    it "has correct password" do
      expect(school.authenticate('1234')).to be_a School
    end

    it "has correct bio" do
      expect(school.bio).to eq "Opened Last Thursday."
    end

    it "has correct days open" do
      expect(school.time_open.start_time).to be_an_instance_of(ActiveSupport::TimeWithZone)
      expect(school.time_open.end_time).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end

  end





  # context "instance" do

  #   before(:all) do
  #     @school = FactoryGirl.create(:school)

  #     @teacher = FactoryGirl.create(:teacher)
  #     @school.teachers << @teacher
  #     @school.time_open = FactoryGirl.create(:time_open)
  #   end

  #   # after(:all) do
  #   #   @school.try(:destroy)
  #   #   @teacher.try(:destroy)
  #   # end

  #   it "has correct name" do
  #     expect(@school.name).to match(/^school\d*$/i)
  #   end

  #   it "has correct location" do
  #     expect(@school.location).to match(/^\d*[.]\d*\s\d*[.]\d*$/)
  #   end

  #   it "has correct password" do
  #     expect(@school.authenticate('1234')).to be_a School
  #   end

  #   it "has correct bio" do
  #     expect(@school.bio).to eq "Opened Last Thursday."
  #   end

  #   it "has correct days open" do
  #     expect(@school.time_open.start_time).to be_an_instance_of(ActiveSupport::TimeWithZone)
  #     expect(@school.time_open.end_time).to be_an_instance_of(ActiveSupport::TimeWithZone)
  #   end

  # end
end
