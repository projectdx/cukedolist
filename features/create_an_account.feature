@story-1
Feature: Create an Account
  When an anonymous user visits the site and does not yet have an account,
  he will have to create a new account

  Background:
    Given I am not logged in
    When I visit the site
    Then I am prompted to log in or create an account

    When I choose to create an account
    Then I am prompted for my new account details

  Scenario: Main Success
    When I create an account with a valid email address and password
    Then I see my todo list

  Scenario: Invalid Data for New Account
    When I create an account with an invalid email address or password
    Then I see a validation error
    And I am prompted for my new account details
