@tba @story-1
Feature: Log Out
  The user logs out of the system and must log back in to use it again

  Scenario: Main Success
    When I log in
    And I choose to log out
    Then I do not see my todo list
    And I am prompted to log in or create an account
