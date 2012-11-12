Feature: Create channels
  In order to create channels
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
      And I should see "You do have a profile and its name Kyle"
      And I should see "You do not have channels"
      When I follow "Add Channel"
      And I fill in "Title" with "My Channel 1"
      And I fill in "Url" with "http://www.heritage.com1"
      And I press "Create"
      And I should see "Channel has been created"
      And I should see "Total Channels 1"
