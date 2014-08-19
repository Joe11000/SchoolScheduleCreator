require 'spec_helper'

# test the model methods



describe School do

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
    it { should have_many(:schedules).dependent(:destroy) }
    it { should have_many(:open_times).class_name('Timespan').dependent(:destroy) }

  end

  context "factory" do
    context "invalid if" do
      it "missing any single element", smoke: true do
        [:name, :location, :bio].each do |element|
          expect(FactoryGirl.build(:school, element => nil )).not_to be_valid
        end
      end
    end

    context "valid if" do
      it "created by default", smoke: true do
        # debugger
        expect(FactoryGirl.build(:school)).to be_valid
      end

      context "instance" do
        let(:school) {FactoryGirl.build_stubbed(:school)}

        it "has correct name" do
          expect(school.name).to match(/^school\d*$/i)
        end

        it "has correct location" do
          expect(school.location).to match(/^\d*[.]\d*\s\d*[.]\d*$/)
        end

        it "has correct bio" do
          expect(school.bio).to eq "Opened Last Thursday."
        end

        # it "has correct days open" do
        #   expect(school.open_times.start_time).to be_an_instance_of(ActiveSupport::TimeWithZone)
        #   expect(school.open_times.end_time).to be_an_instance_of(ActiveSupport::TimeWithZone)
        # end
      end
    end
  end

  it "test instance methods"
end
