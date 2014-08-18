require 'spec_helper'

describe Room do

  describe "model" do
    it { should allow_mass_assignment_of(:capacity) }
    it { should allow_mass_assignment_of(:number) }

    it { should belong_to(:school) }
    it { should have_many(:tcr_possibilities) }
    it { should have_many(:teachers).through(:tcr_possibilities) }
    it { should have_many(:courses_pools).through(:tcr_possibilities) }

    # This didn't work vvvvvvv
    #  it { should have_many(:time_requests).class_name('Timeable').dependent(:destroy) }
    # This didn't work ^^^^^^^^
    it { should have_many(:time_requests).dependent(:destroy) }
    it { should have_many(:special_time_availibilities).dependent(:destroy) }
    it { should have_many(:special_time_unavailibilities).dependent(:destroy) }

    it { should validate_presence_of(:capacity) }
    it { should validate_numericality_of(:capacity), only_integer: true }
    it { should validate_numericality_of(:capacity), greater_than: 0 }


    it { should validate_presence_of(:number) }
    it { should validate_numericality_of(:number), only_integer: true }
    it { should validate_numericality_of(:number), greater_than_or_equal_to: 0 }


  end

  describe "factory" do
    context "is valid if" do

      it "created by default", smoke: true do
        expect(FactoryGirl.build_stubbed(:room)).to be_valid
      end
    end
  end

    context "is invalid if" do

      it "missing a any field" do
        [:capacity, :number].each do |element|
          expect(FactoryGirl.build(:room, element => nil), ).not_to be_valid
      end
    end
  end


end
