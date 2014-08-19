require 'spec_helper'

describe Timespan do
  describe "model" do
    it { should allow_mass_assignment_of(:start_time)}
    it { should validate_presence_of(:start_time)}

    it { should allow_mass_assignment_of(:end_time)}
    it { should validate_presence_of(:end_time)}

    it { should allow_mass_assignment_of(:special_availablilityy)}
    it { should ensure_inclusion_of(:special_availablilityy).in_array(%w(none available unavailable))}

  end

  describe "factory" do
    context "is valid if" do
      context "created by default" do
        it { expect(FactoryGirl.build(:timespan)).to be_valid}
      end
    end

    context "is invalid if" do
      it "missing a any field" do
        [:start_time, :end_time].each do |element|
          expect(FactoryGirl.build(:timespan, element => nil), ).not_to be_valid
        end
      end
    end
  end

  it "test instance methods"
end
