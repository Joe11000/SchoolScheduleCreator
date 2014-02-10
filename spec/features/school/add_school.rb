require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

describe "new_school page" do
	describe "visitor" do
	  before(:each) {visit new_school_path}

    it "can see page" do
      current_path.should eq new_school_path
    end

    it "can see form" do
    	find_by_id('new_school_form').visible?
    end

    it "form has everything it needs" do
    	within "new_school_form" do
    	  find('school_name').visible?       # xit "can see box to enter school name" do
    	  find('password').visible?          # xit "can see box to enter password and password_confirmation" do
    	  find('password_confirmation').visible?
        find('location').visible?
        find('bio').visible?
    	  find_button('next').visible?       # xit "can see 'next' button" do
      end
    end

    it "can continue to /new_courses if school doesn't exist yet" do
      expect {
      	within("#login_form") do
          fill_in :name,                  with:"-=Not_REAL423xs?^?"
          fill_in :password,              with: "1d3"
          fill_in :password_confirmation, with: "1d3"
          fill_in :location,              with: "19322.5343 12452.52315"
          fill_in :bio,                   with: "I like turtles!"
          click_button('next')
        end
      }.to change{School.count}.by(1)

      current_path.should eq new_course_path
      school.try(:destroy)
    end

    it "sees an error if school already exists" do
      school = FactoryGirl.create(:school)

      expect {
        within("#login_form") do
          fill_in :name,                  with: school.name
          fill_in :password,              with: school.password
          fill_in :password_confirmation, with: school.password_confirmation
          fill_in :location,              with: school.location
          fill_in :bio,                   with: school.bio
        end
        click_button('login')
      }.not_to change{School.count}


      current_path.should eq new_school_path
      page.should have_content("School Name Exists Already")
      school.try(:destroy)
    end
  end
end