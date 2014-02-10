# require 'spec_helper'
# require 'capybara/dsl'
# include Capybara::DSL

# describe "new_school page" do
# 	describe "visitor" do
# 	  before(:each) {visit new_school_path}

#     it "can see page" do
#       current_path.should eq new_school_path
#     end

#     xit "can see form" do
#     	find_by_id('new_school_form').visible?
#     end

#     xit "form has everything it needs" do
#     	within "new_school_form" do
#     	  find('school_name').visible?       # xit "can see box to enter school name" do
#     	  find('password').visible?          # xit "can see box to enter password and password_confirmation" do
#     	  find('password_confirmation').visible?
#     	  find_button('next').visible?       # xit "can see 'next' button" do
#       end
#     end

#     xit "can continue to /new_courses if school doesn't exist yet" do
#     	within("#login_form") do
#         fill_in :name,                  with:"-=Not_REAL423xs?^?"
#         fill_in :password,              with: "1d3"
#         fill_in :password_confirmation, with: "1d3"
#         click_button('next')
#       end

#       current_path.should eq new_course_path
#       school.try(:destroy)
#     end

#     xit "sees an error if school already exists" do

#       school = FactoryGirl.create(:school)

#       within("#login_form") do
#         fill_in :name,                  with: school.name
#         fill_in :password,              with: 1234
#         fill_in :password_confirmation, with: 1234
#       end

#       click_button('login')
#       current_path.should eq new_school_path
#       page.should have_content("School Name Exists Already")
#     end
#   end
# end