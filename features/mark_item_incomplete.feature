@tba @story-1
Feature: Mark Item Incomplete
  The user marks a todo list item incomplete when a task isn't really finished

  Scenario: Main Success
    Given my todo list contains the following items:
      | status     | todo            |
      | complete   | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | incomplete | Take a nap      |
    When I log in
    And I mark the first todo item incomplete
    Then I should see the following items in my todo list:
      | status     | todo            |
      | incomplete   | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | incomplete   | Take a nap      |
    When I log out
    And I log back in
    Then I should see the following items in my todo list:
      | status     | todo            |
      | incomplete   | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | incomplete   | Take a nap      |
