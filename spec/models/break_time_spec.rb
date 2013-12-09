require 'spec_helper'

describe BreakTime do
  before(:all) do
    @teacher    = FactoryGirl.create(:teacher)
    @break_time = FactoryGirl.create(:break_time)
    @teacher.break_times << @break_time
  end

  it "has a valid factory" do
    FactoryGirl.create(:break_time).should be_valid
  end

  it { should allow_mass_assignment_of(:start_time) }
  it { should allow_mass_assignment_of(:end_time) }
  it { should allow_mass_assignment_of(:confirmed) }

  it { should belong_to(:teacher) }

  it "correct start time" do
  	expect(@break_time.start_time).to eq Time.new(2013,12,31,6,30)
  end

  it "correct end time" do
  	expect(@break_time.end_time).to eq Time.new(2013,12,31,7,30)
  end

  it "correct end time" do
  	expect(@break_time.teacher).to eq @teacher
  end

  it "correct end time" do
    expect(@teacher.break_times.first).to eq @break_time
  end
end
