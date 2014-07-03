Feature: Welcome

Background:
  Given I visit root


  Scenario: Am I home
    When I do nothing else
    Then I am on root

  Scenario: new school
    When I click the new_school link
    Then I am on the new school page


  @selenium
  Scenario: log in
    When I log in as an existing school. I am now on schools page





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
