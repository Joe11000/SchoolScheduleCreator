require 'spec_helper'

describe Timespan do
  it { should allow_mass_assignment_of(:start_time)}
  it { should allow_mass_assignment_of(:end_time)}

  it { should validate_presence_of(:start_time)}
  it { should validate_presence_of(:end_time)}

  describe "instance" do
    before(:all) do
    	@timespan = FactoryGirl.create(:timespan)
    end

    after(:all) do
      @timespan.destroy
    end

    it { expect(FactoryGirl.create(:timespan)).to be_valid}

    # it { @time }

  end
end
