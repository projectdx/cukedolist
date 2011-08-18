@story-1
Feature: Log In
  The user must log in with his account in order to use the site.

  Background:
    Given I have an account
    But I am not logged in
    When I visit the site
    Then I am prompted to log in or create an account

  Scenario: Main Success
    When I log in
    Then I see my todo list

  Scenario: Invalid Credentials
    When I attempt to log in with an invalid email address or password
    Then I see a message that the login attempt failed
    And I am prompted to log in or create an account
