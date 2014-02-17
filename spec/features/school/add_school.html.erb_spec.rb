require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

describe "visitor creating school" do
	before(:each) do
    visit new_school_path
	end

	# after(:each) do
 #    School.try(:last).try(:destroy)
	# end

  it "can see all contents to add new class" do
    within "#new_school" do
      find_field("school_name").visible?
      find_field("school_password").visible?
      find_field("school_password_confirmation").visible?
      find_field("school_location").visible?
      find_field("school_bio").visible?

      find_button("next").visible?
    end
  end

  it "can fill out form" do
    within "#new_school" do
      fill_in "school_name",                  with: "School_#{School.count}"
      fill_in "school_password",              with: 1234
      fill_in "school_password_confirmation", with: 1234
      fill_in "school_location",              with: "#{School.count}.#{rand(888)} #{School.count}.#{rand(888)}"
      fill_in "school_bio",                   with: "We are sweet"
    end
  end

  it "submit form -> taken to courses page" do
		within "#new_school" do
      fill_in "school_name",                  with: "School_#{School.count}"
      fill_in "school_password",              with: 1234
      fill_in "school_password_confirmation", with: 1234
      fill_in "school_location",              with: "#{School.count}.#{rand(888)} #{School.count}.#{rand(888)}"
      fill_in "school_bio",                   with: "We are sweet"

      click_button("next")
    end
    current_path.should eq courses_path
    School.try(:last).try(:destroy)
  end

  it "has form saved to db upon submission" do
  	s_name = "School_#{School.count}"
  	s_pwd = 1234
  	s_location = "#{School.count}.#{rand(888)} #{School.count}.#{rand(888)}"
  	s_bio = "We are sweet"

  	expect{
      within "#new_school" do
        fill_in "school_name",                  with: s_name
        fill_in "school_password",              with: s_pwd
        fill_in "school_password_confirmation", with: s_pwd
        fill_in "school_location",              with: s_location
        fill_in "school_bio",                   with: s_bio

        find_button("next").click
      end
    }.to change{School.count}.by(1)

    s = School.last
    expect(s.name == s_name).to be_true
    expect(s.authenticate(s_pwd)).to_not be_false
    expect(s.location == s_location).to be_true
    expect(s.bio == s_bio).to be_true

    School.try(:last).try(:destroy)
  end
end