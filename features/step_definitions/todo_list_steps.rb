Given /^my todo list is empty$/ do
  api_driver.delete_todo_list
end

Given /^my todo list contains the following items:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I add the following items to my todo list:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I mark the first todo item complete$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I mark the third todo item complete$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I mark the first todo item incomplete$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the following items in my todo list:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^I see my todo list$/ do
  ui_driver.should have_todo_list
end

Then /^I do not see my todo list$/ do
  ui_driver.should_not have_todo_list
end
