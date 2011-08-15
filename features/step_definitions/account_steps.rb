Given /^I have an account$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am not logged in$/ do
  ui_driver.force_logout
end

When /^I log in$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I log out$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I choose to create an account$/ do
  ui_driver.choose_to_create_account
end

When /^I create an account with a valid email address and password$/ do
  ui_driver.provide_new_account_details
end

When /^I create an account with an invalid email address or password$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I log in with a valid email address and password$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I attempt to log in with an invalid email address or password$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I choose to log out$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am prompted to log in or create an account$/ do
  ui_driver.should have_login_prompt
  ui_driver.should have_account_creation_prompt
end

Then /^I am prompted for my new account details$/ do
  ui_driver.should have_new_account_form
end

Then /^I see a message that the login attempt failed$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I see a message welcoming me to the site as a new user$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I see a message welcoming me back to the site$/ do
  pending # express the regexp above with the code you wish you had
end
