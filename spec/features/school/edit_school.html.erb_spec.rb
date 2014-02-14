require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

describe "visitor creating school" do
	before(:each) do
    visit new_school_path
    # save_and_open_page
    within "#new_school" do
      fill_in "school_name",                  with: "School_#{School.count}"
      fill_in "school_password",              with: 1234
      fill_in "school_password_confirmation", with: 1234
      fill_in "school_location",              with: "#{School.count}.#{rand(888)} #{School.count}.#{rand(888)}"
      fill_in "school_bio",                   with: "We are sweet"
    end

    click_button("next")

    @current_school = School.last

    visit edit_school_path(@current_school)
	end

	after(:all) do
    @current_school.try(:destroy)
	end

  it "can see all contents to add new class" do
  	find_by_id("school_name")
      find_field("school_name").visible?
      find_field("school_password").visible?
      find_field("school_password_confirmation").visible?
      find_field("school_location").visible?
      find_field("school_bio").visible?

      find_button("edit").visible?
  end

  it "form has previous content" do
      find_field("school_name").value()    == @current_school.name
      find_field("school_location").value() == @current_school.location
      find_field("school_bio").value()      == @current_school.bio
  end

  it "can make a change on all fields" do #submit form -> taken to show page" do
    fill_in "school_name",                  with: "a"
    fill_in "school_password",              with: 1234
    fill_in "school_password_confirmation", with: 1234
    fill_in "school_location",              with: "a"
    fill_in "school_bio",                   with: "a"
    # current_path.should eq "schools/#{@current_school.id}"
  end

  it "has form saved to db upon submission" do
  	s_name = "-fdanikfd"
  	s_pwd = 1234
  	s_location = "9832h9pfsano---2r"
  	s_bio = "vndew9032nf2;=-dsfa=-f"

  	expect{
        fill_in "school_name",                  with: s_name
        fill_in "school_password",              with: s_pwd
        fill_in "school_password_confirmation", with: s_pwd
        fill_in "school_location",              with: s_location
        fill_in "school_bio",                   with: s_bio

        find_button("edit").click
    }.to change{School.count}.by(0)

    s = School.last
    expect(s.name == s_name).to be_true
    expect(s.authenticate(s_pwd)).to_not be_false
    expect(s.location == s_location).to be_true
    expect(s.bio == s_bio).to be_true
  end
end