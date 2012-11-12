Feature: Delete channels
  In order to delete channels
  A user
  Should be able to delete them

    Background:
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
      And I should see "You do not have channels"
      When I follow "Add Channel"
      And I fill in "Title" with "My Channel 1"
      And I fill in "Url" with "http://www.heritage.com1"
      And I press "Create"
      And I should see "Channel has been created"
      And I should see "Total Channels 1"
      When I follow "My Channel 1"
      When I follow "Edit Channel"

    Scenario: User edits channel successfully
      And I fill in "Title" with "My Channel 3"
      And I press "Update"
      And I should see "Channel has been updated"
      And I should see "Total Channels 1"
      And I should see "My Channel 3"
      And I should not see "My Channel 1"

    Scenario: User does not continue
      When I follow "Cancel"
      And I should see "Total Channels 1"
      And I should see "My Channel 1"
      And I should not see "My Channel 3"
