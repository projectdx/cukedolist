When /^I visit the site$/ do
  ui_driver.go_to_home_page
end

Then /^I see a validation error$/ do
  ui_driver.should have_validation_error
end
