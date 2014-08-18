require 'spec_helper'

describe Schedule do

  describe "model" do

    it { should belong_to(:school) }

    it { should have_many(:rooms).through(:tcr_possibilities) }
    it { should have_many(:tcr_possibilities).dependent(:destroy) }
    it { should have_many(:teachers).through(:tcr_possibilities) }
    it { should have_many(:courses_pools).through(:tcr_possibilities) }

  end

end




# require 'rails_helper'

# RSpec.describe Schedule, :type => :model do

# end
