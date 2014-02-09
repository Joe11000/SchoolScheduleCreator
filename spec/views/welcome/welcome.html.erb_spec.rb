require 'spec_helper'
# require 'capybara/rspec'
require 'capybara'

  describe "welcome page" do
    # it "returns http success" do
    #   get '/'
    #   response.should be_success
    # end

    describe "user can" do

      it "can click 'new school' to get to new_school_path"
        visit new_school_path
        # visit '/'
        click_link "New School"

        current_page.should eq new_school_url
      end


    # within("//li[@id='employee']") do
    #   fill_in 'Name', :with => 'Jimmy'
    # end
  end
