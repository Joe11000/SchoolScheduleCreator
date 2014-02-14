# require 'spec_helper'
# require 'capybara/dsl'
# include Capybara::DSL

# describe "school logged in" do
# 	before(:all) do
#     visit new_school_path
# 	end

#   it "can see all contents to add new class" do
#     # find_field("subject").visible?
#     # find_field("course_number").visible?
#     # find_field("min_students_to_teach").visible?
#     # find_button("button").visible?
#   end

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
# end

# 		# save_and_open_page




# 		# <input id="subject" name="subject" placeholder="ie Algebra" type="text" value="Advanced Algebra">
#     # <input id="school_bio" name="school[bio]" type="text" value="We are sweet">
