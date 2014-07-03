# require 'spec_helper'
# require 'capybara/dsl'
# include Capybara::DSL


   step "I do nothing else" do

   end

	step "I visit root" do
		visit root_path
	end

	step "I am on root" do
	  current_path.should eq root_path
	end

    step "I click the new_school link" do
      find(:css, "#new_school").click
    end

    step "I log in as an existing school. I am now on schools page" do
      school = FactoryGirl.create(:school)

      within(:css, "#login_form") do
        fill_in :name,     with: school.name
        fill_in :password, with: 1234
        # save_and_open_page
        # debugger
      end
      click_button('login')
      # save_and_open_page
      # debugger
      # response.should redirect_to school_path

      # page should not contain Unsucessful login
	end

    step "I am on the new school page" do
      current_path.should eq new_school_path
    end

# find(:css, "#login_form name")
#

      # within(:css, "#login_form") {find_field('name')}
      #    within(:css, "#login_form") { find_field('password')}
      #
      # end

# describe "welcome page" do
# 	describe "visitor" do
# 	  before(:each) {visit root_path}

#     it "can see page" do
#       current_path.should eq root_path
#     end

#     it "can see link to create new school" do
#     	find_link('New School').visible?
#     end

#     it "can be taken to page to create new school" do
#     	 click_link("New School")
#     	 current_path.should eq new_school_path
#     end

#     it "can see form on screen" do
#       find_by_id('login_form').visible?
#     end

#     it "can see all contents in form" do
#       within("#login_form") do
#         find_field('name').visible?
#         find_field('password').visible?
#         find_button('login').visible?
#       end
#     end

#     it "can login if a current school" do
#       school = FactoryGirl.create(:school)

#       within("#login_form") do
#         fill_in :name,     with: school.name
#         fill_in :password, with: 1234

#         click_button('login')
#       end
#       current_path.should eq school_path(school)

#       school.try(:destroy)
#     end

#     it "sees an error if login incorrect" do
#     	within("#login_form") do
#         fill_in :name,     with:"-=Not_REAL423xs?^?"
#         fill_in :password, with: "1d3"
#       end

#       click_button('login')
#       current_path.should eq root_path
#       page.should have_content("Unsuccessful Log In")
#     end
#   end
# end

