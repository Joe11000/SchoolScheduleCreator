# require 'spec_helper'
# require 'capybara/dsl'
# include Capybara::DSL


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

@welcome 
Feature: Welcome
  # As a Splat user,
  # I want my dashboard to be functional. This includes:
  #   - Create a Subscription list*
  # - Create an Incentive campaign*
  # - Create an Info campaign*
  # - Create a Last Played campaign*
  # - Create a Request campaign*
  # - Create a Text-2-Win campaign*
  # - Create a Trivia campaign*
  # - Create a Vote campaign*

  # * assume being directed to the working 'create' page is sufficient for success. These scenarios do not actually create campaigns (as that is tested in the respective 'Create' feature files.)

  Background:
    Given I am on the home page

#     it "can see link to create new school" do
#       find_link('New School').visible?
#     end

  Scenerio: New School Link On Screen
    Then I can see the link to create new school

  # Scenerio: The login form is on the screen
  #   Then I can see school login form
   







  # Scenario: Create a New Campaign - Subscription
  #   When I click the 'Create a New Campaign' button
  #   And select 'Alert' from the dropdown menu
  #   Then I should be directed to the 'New Subscription Campaign' page

  # Scenario: Create a New Campaign - Incentive
  #   When I click the 'Create a New Campaign' button
  #   And select 'Incentive' from the dropdown menu
  #   Then I should be directed to the 'New Incentive Campaign' page

  # Scenario: Create a New Campaign - Info
  #   When I click the 'Create a New Campaign' button
  #   And select 'Info' from the dropdown menu
  #   Then I should be directed to the 'New Info Campaign' page

  # Scenario: Create a New Campaign - Last Played
  #   When I click the 'Create a New Campaign' button
  #   And select '"Last Played"' from the dropdown menu
  #   Then I should be directed to the 'New "Last Played" Campaign' page

  # Scenario: Create a New Campaign - Request
  #   When I click the 'Create a New Campaign' button
  #   And select 'Request' from the dropdown menu
  #   Then I should be directed to the 'New Request Campaign' page

  #   # this is pended until integration has a contest engine
  # @pend
  # Scenario: Create a New Campaign - Text-2-Win
  #   When I click the 'Create a New Campaign' button
  #   And select 'Text-2-Win' from the dropdown menu
  #   Then I should be directed to the 'New Text-2-Win Campaign' page

  # Scenario: Create a New Campaign - Trivia
  #   When I click the 'Create a New Campaign' button
  #   And select 'Trivia' from the dropdown menu
  #   Then I should be directed to the 'New Trivia Campaign' page

  # Scenario: Create a New Campaign - Vote
  #   When I click the 'Create a New Campaign' button
  #   And select 'Vote' from the dropdown menu
  #   Then I should be directed to the 'New Vote Campaign' page
