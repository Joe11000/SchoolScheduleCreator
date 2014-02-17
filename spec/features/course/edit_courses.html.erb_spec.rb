require 'spec_helper'
require 'capybara/dsl'
include Capybara::DSL

  def starting_point_to_edit_courses
    visit root_path
    click_link "New School"

    visit new_school_path

    within "#new_school" do
      fill_in "school_name",                  with: "School_#{School.count}"
      fill_in "school_password",              with: 1234
      fill_in "school_password_confirmation", with: 1234
      fill_in "school_location",              with: "#{School.count}.#{rand(888)} #{School.count}.#{rand(888)}"
      fill_in "school_bio",                   with: "We are sweet"
    end

    click_button("next")

    fill_in "subject", with: "biology"
    fill_in "course_number", with: "bio_101"
    fill_in "min_students_to_teach", with: 10

    click_button "add"

    fill_in "subject", with: "math"
    fill_in "course_number", with: "MAT_101"
    fill_in "min_students_to_teach", with: 8

    click_button "add"
    click_button "next"

    visit courses_path
  end

    # # Test the second class added
    # page.driver.browser.evaluate_script("$('tr:eq(2) td:eq(0) input').val()").should eq c_subject
    # page.driver.browser.evaluate_script("$('tr:eq(2) td:eq(1) input').val()").should eq c_course_number
    # page.driver.browser.evaluate_script("$('tr:eq(2) td:eq(2) input').val()").should eq c_min_students_to_teach.to_s
    # page.driver.browser.evaluate_script("$('tr:eq(2) td:eq(3) .delete_img')").should be_true



describe "school editing courses" do

  it "can see 'Edit Courses' somewhere on screen", js: true do
    starting_point_to_edit_courses()
    page.should have_content("Edit Courses")
  end

  it "can see all contents to add new class", js: true do
    starting_point_to_edit_courses()

    find_field("subject").visible?
    find_field("course_number").visible?
    find_field("min_students_to_teach").visible?
    find_button("add").visible?
    find_button("update").visible?
    find_button("update").disabled?
  end

  it "have existing courses", js: true do
    starting_point_to_edit_courses()
  	expect(page.driver.browser.evaluate_script("$('.course_row').toArray().length ")).to eq School.last.courses_pools.count
  end

  it "can change a course on screen", js: true do
    starting_point_to_edit_courses()
    save_and_open_page
    find_field("#subject").value
    # c_subject       = page.driver.browser.evaluate_script("$('.course_row:eq(0) td:eq(0) input').val()")
    # c_course_number         = "bio_101"
    # c_min_students_to_teach = 10

    # c_new_min_students_to_teach = 999

    # expect{
    #   fill_in "subject", with: c_subject
    #   fill_in "course_number", with: c_course_number
    #   fill_in "min_students_to_teach", with: c_min_students_to_teach

    #   # save_and_open_page
    #   click_button "add"
    # }.to change{page.driver.browser.evaluate_script("$('.course_row').toArray().length")}.from(0).to(1)

    # # Test the first class added
    # page.driver.browser.evaluate_script("$('.course_row:eq(0) td:eq(0) input').val()").should eq c_subject
    # page.driver.browser.evaluate_script("$('.course_row:eq(0) td:eq(1) input').val()").should eq c_course_number
    # page.driver.browser.evaluate_script("$('.course_row:eq(0) td:eq(2) input').val()").should eq c_min_students_to_teach.to_s
    # page.driver.browser.evaluate_script("$('.course_row:eq(0) td:eq(3) img')").should be_true
  end

    xit "next butten enabled after adding course", js: true do
      c_subject               = "biology"
      c_course_number         = "bio_101"
      c_min_students_to_teach = 10

      fill_in "subject", with: c_subject
      fill_in "course_number", with: c_course_number
      fill_in "min_students_to_teach", with: c_min_students_to_teach

      # save_and_open_page
      click_button "add"

      expect(find_button("next").disabled?).to be_false
  end


  xit "can add multiple courses", js: true do
    c_subject               = "Algebra"
    c_course_number         = "MAT_231"
    c_min_students_to_teach = 7

    expect{
      fill_in "subject", with: "biology"
      fill_in "course_number", with: "bio_101"
      fill_in "min_students_to_teach", with: 10
      click_button "add"

      fill_in "subject", with: c_subject
      fill_in "course_number", with: c_course_number
      fill_in "min_students_to_teach", with: c_min_students_to_teach
      click_button "add"
      # save_and_open_page
    }.to change{page.driver.browser.evaluate_script("$('.course_row').toArray().length")}.from(0).to(2)

    # Test the second class added
    page.driver.browser.evaluate_script("$('.course_row:eq(1) td:eq(0) input').val()").should eq c_subject
    page.driver.browser.evaluate_script("$('.course_row:eq(1) td:eq(1) input').val()").should eq c_course_number
    page.driver.browser.evaluate_script("$('.course_row:eq(1) td:eq(2) input').val()").should eq c_min_students_to_teach.to_s
    page.driver.browser.evaluate_script("$('.course_row:eq(1) td:eq(3) .delete_img')").should be_true
  end

  xit "can submit multiple courses", js: true do
    c1_subject               = "biology"
    c1_course_number         = "bio_101"
    c1_min_students_to_teach = 10
    c2_subject               = "Algebra"
    c2_course_number         = "MAT_231"
    c2_min_students_to_teach = 7

    fill_in "subject", with: c1_subject
    fill_in "course_number", with: c1_course_number
    fill_in "min_students_to_teach", with: c1_min_students_to_teach
    click_button "add"

    fill_in "subject", with: c2_subject
    fill_in "course_number", with: c2_course_number
    fill_in "min_students_to_teach", with: c2_min_students_to_teach
    click_button "add"

    click_button "next"
    @current_school = School.last

    # save_and_open_page

    debugger
    expect(@current_school.courses_pools.size).to eq 2
    class_1 = @current_school.courses_pools.find_by_subject(c1_subject)
    debugger
    expect(class_1.course_number).to eq c1_course_number
    expect(class_1.min_students_to_teach).to eq c1_min_students_to_teach

    debugger
    class_2 = @current_school.courses_pools.find_by_subject(c2_subject)
    expect(class_2.course_number).to eq c2_course_number
    debugger
    expect(class_2.min_students_to_teach).to eq c2_min_students_to_teach

    School.last.destroy
    CoursesPool.last(2).destroy
  end
end

# 		# save_and_open_page

# 		# <input id="subject" name="subject" placeholder="ie Algebra" type="text" value="Advanced Algebra">
#     # <input id="school_bio" name="school[bio]" type="text" value="We are sweet">
