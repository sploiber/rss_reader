Feature: Create profiles
  In order to create profiles for users
  A user
  Should be able to create them

    Scenario: User signs in successfully
      Given I exist as a user
        And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in
      And I should see "You do not have a profile"
      Given there is a profile type called "Basic"
      When I follow "New Profile"
      And I fill in "Name" with "Kyle"
      And I select "Basic" from "profile[profile_type_id]"
      And I press "Create"
      And I should see "You do have a profile and its name is Kyle"

    Scenario: User chooses not to proceed
      Given I exist as a user
        And I am not logged in
      When I sign in with valid credentials
      Then I see a successful sign in message
      When I return to the site
      Then I should be signed in
      And I should see "You do not have a profile"
      Given there is a profile type called "Basic"
      When I follow "New Profile"
      And I follow "Cancel"
      And I should see "You do not have a profile"
