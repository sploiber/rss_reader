Feature: Edit profiles
  In order to keep profiles for users clean
  A user
  Should be able to edit them

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
      And I should see "You do have a profile and its name Kyle"
      And I follow "Edit Profile"
      And I fill in "Name" with "Shaquille"
      And I press "Update"
      And I should see "You do have a profile and its name Shaquille"

    Scenario: User decides not to proceed
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
      And I should see "You do have a profile and its name Kyle"
      And I follow "Edit Profile"
      And I follow "Cancel"
      And I should see "You do have a profile and its name Kyle"
