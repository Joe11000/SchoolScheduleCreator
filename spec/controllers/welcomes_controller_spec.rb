require 'spec_helper'

describe WelcomesController do

  describe "GET 'welcome'" do
    it "returns http success" do
      get '/'
      response.should be_success
      page.shou
    end
  end

end
