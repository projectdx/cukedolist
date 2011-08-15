When /^I visit the site$/ do
  ui_driver.go_to_home_page
end

Then /^I see a validation error$/ do
  pending # express the regexp above with the code you wish you had
end
