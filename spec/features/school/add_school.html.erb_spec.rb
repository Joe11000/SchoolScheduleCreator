require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

describe "new_school page" do
  describe "visitor" do
    before(:each)  do
      visit new_school_path
    end

    it "can see page" do
      current_path.should eq new_school_path
    end

    it "can see form" do
    	find('#new_school').visible?
    end

    it "can see all contents form needs" do
      within("#new_school") do
        find_field('school[name]').visible?       # xit "can see box to enter school name" do
        find_field('school[password]').visible?          # xit "can see box to enter password and password_confirmation" do
        find_field('school[password_confirmation]').visible?
        find_field('school[location]').visible?
        find_field('school[bio]').visible?
        find_button('next').visible?       # xit "can see 'next' button" do
      end
    end

    it "can create a new school from submitted form" do
      visit new_school_path

      expect {
        within("#new_school") do
          fill_in "school[name]",                  with:"-=Not_REAL423xs?^?"
          fill_in "school[password]",              with: "1d3"
          fill_in "school[password_confirmation]", with: "1d3"
          fill_in "school[location]",              with: "19322.5343 12452.52315"
          fill_in "school[bio]",                   with: "I like turtles!"
          click_button('next')
        end
      }.to change{School.count}.by(1)

      School.try(:last).try(:destroy)
    end

    it "directed to the " do
      visit new_school_path

      within("#new_school") do
        fill_in "school[name]",                  with:"=Not_REAL423xs?^?2"
        fill_in "school[password]",              with: "1d3"
        fill_in "school[password_confirmation]", with: "1d3"
        fill_in "school[location]",              with: "19322.5343 12452.52315"
        fill_in "school[bio]",                   with: "I like turtles!"
        click_button('next')
      end

      current_path.should eq new_school_course_path(School.last)
      School.try(:last).try(:destroy)
    end
  end
end