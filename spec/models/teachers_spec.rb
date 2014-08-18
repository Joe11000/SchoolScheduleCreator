require 'spec_helper'


# test the model methods


describe Teacher do
  describe "model" do

    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:bio) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bio) }

    it { should belong_to(:school) }

    it { should have_many(:break_times).dependent(:destroy) }
    it { should have_many(:tcr_possibilities).dependent(:destroy)}
    it { should have_many(:courses_could_teach).through(:tcr_possibilities).source(:courses_pool) }
    it { should have_many(:courses_teaching).through(:tcr_possibilities).source(:courses_pool)}

  end

  describe "factory" do
    context "is valid if" do
      let(:teacher){ FactoryGirl.build(:teacher) }

      it "is valid", smoke: true do
        expect(teacher).to be_valid
      end

      it "has a name" do
        expect(teacher.name).to eq "Jill Teacher"
      end

      it "has a bio" do
        expect(teacher.bio).to eq "Does the teaching thing"
      end
    end

    context "is invalid if" do
      it "missing any single element", smoke: true do
        [:name, :bio].each do |element|
          expect(FactoryGirl.build(:teacher, element => nil )).not_to be_valid
        end
      end
    end
  end

end
