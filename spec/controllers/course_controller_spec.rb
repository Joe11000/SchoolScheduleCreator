require 'spec_helper'

describe CourseController do

  describe "GET 'add_courses'" do
    it "returns http success" do
      get 'add_courses'
      response.should be_success
    end
  end

end
