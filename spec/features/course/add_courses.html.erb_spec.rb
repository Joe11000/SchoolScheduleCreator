require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

describe "school adding courses" do

	before(:each) do
    visit new_school_path

    within "#new_school" do
      fill_in "school_name",                  with: "School_#{School.count}"
      fill_in "school_password",              with: 1234
      fill_in "school_password_confirmation", with: 1234
      fill_in "school_location",              with: "#{School.count}.#{rand(888)} #{School.count}.#{rand(888)}"
      fill_in "school_bio",                   with: "We are sweet"

      click_button("next")
    end
	end

  it "can see 'Add Courses' somewhere on screen" do
  	page.should have_content("Add Courses")
  end

  it "can see all contents to add new class" do
    find_field("subject").visible?
    find_field("course_number").visible?
    find_field("min_students_to_teach").visible?
    find_button("add").visible?
    find_button("next").visible?
  end

  it "have no existing courses", js: true do
  	expect(page.driver.browser.evaluate_script("$('tr').toArray().length ")).to eq 1
  end

  it "can add a course", js: true do
    expect{
      fill_in "subject", with: "biology"
      fill_in "course_number", with: "bio_101"
      fill_in "min_students_to_teach", with: 10

      save_and_open_page
      click_button "add"
    }.to change{page.driver.browser.evaluate_script("$('tr').toArray().length")}.from(1).to(2)

  end

  it "can add multiple courses", js: true do
    expect{
      fill_in "subject", with: "biology"
      fill_in "course_number", with: "bio_101"
      fill_in "min_students_to_teach", with: 10
      click_button "add"

      fill_in "subject", with: "Algebra"
      fill_in "course_number", with: "MAT_231"
      fill_in "min_students_to_teach", with: 7
      click_button "add"
    }.to change{page.driver.browser.evaluate_script("$('tr').toArray().length")}.from(1).to(3)

  end

  it "can submit multiple courses", js: true do

    fill_in "subject", with: "biology"
    fill_in "course_number", with: "BIO_101"
    fill_in "min_students_to_teach", with: 10
    click_button "add"

    fill_in "subject", with: "algebra"
    fill_in "course_number", with: "MAT_231"
    fill_in "min_students_to_teach", with: 7
    click_button "add"

    click_button "next"
    @current_school = School.last

    debugger
    expect(@current_school.courses_pools.size).to eq 2
    class_1 = @current_school.courses_pools.find_by_subject("biology")
    debugger
    expect(class_1.course_number).to eq "BIO_101"
    expect(class_1.min_students_to_teach).to eq 10

    debugger
    class_2 = @current_school.courses_pools.find_by_subject("algebra")
    expect(class_2.course_number).to eq "MAT_231"
    debugger
    expect(class_2.min_students_to_teach).to eq 7

    School.last.destroy
    CoursesPool.last(2).destroy


  end




# 	it "can create one class" do
# 		# fill_in "subject",               with: "Advanced Algebra"
# 		# fill_in "course_number",         with: "Math_115"
# 		# fill_in "min_students_to_teach", with: 23
# 		# find_button("next").click
# 		# save_and_open_page
# 		# within "" do

# 		# end
# 	end

# 	xit "can create multiple classes" do
# 		fill_in "subject",               with: "Biology"
# 		fill_in "course_number",         with: "BIO_185"
# 		fill_in "min_students_to_teach", with: 11
# 		click_button "next"

# 		fill_in "subject",               with: "Biology"
# 		fill_in "course_number",         with: "BIO_185"
# 		fill_in "min_students_to_teach", with: 11
# 		click_button "next"
# 	end

# 	xit "can submit multiple classes" do
# 		fill_in "subject",               with: "Advanced Algebra"
# 		fill_in "course_number",         with: "Math_115"
# 		fill_in "min_students_to_teach", with: 23
# 		click_button "next"
# 	end
end

# 		# save_and_open_page




# 		# <input id="subject" name="subject" placeholder="ie Algebra" type="text" value="Advanced Algebra">
#     # <input id="school_bio" name="school[bio]" type="text" value="We are sweet">
