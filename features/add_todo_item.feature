@wip @story-1
Feature: Add a Todo Item
  The user adds a new item to his todo list

  Scenario: Main Success
    Given my todo list is empty
    When I log in
    And I add the following items to my todo list:
      | Make a sandwich |
      | Eat a sandwich  |
      | Take a nap      |
    Then I should see the following items in my todo list:
      | status     | todo            |
      | incomplete | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | incomplete | Take a nap      |
    When I log out
    And I log in
    Then I should see the following items in my todo list:
      | status     | todo            |
      | incomplete | Make a sandwich |
      | incomplete | Eat a sandwich  |
      | incomplete | Take a nap      |
