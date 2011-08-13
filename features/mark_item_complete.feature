@wip @story-1
Feature: Mark Item Complete
  The user marks a todo list item complete after finishing a task

  Scenario: Main Success
    Given my todo list contains the following items:
      | status     | todo            |
      | incomplete | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | incomplete | Take a nap      |
    When I log in
    And I mark the first todo item complete
    And I mark the third todo item complete
    Then I should see the following items in my todo list:
      | status     | todo            |
      | complete   | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | complete   | Take a nap      |
    When I log out
    And I log in
    Then I should see the following items in my todo list:
      | status     | todo            |
      | complete   | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | complete   | Take a nap      |
