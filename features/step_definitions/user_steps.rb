Given("I am on the home page") do
  visit root_path
end

When("I click on the {string} button") do |button|
  has_button?(button)
end

When("A confirmation box saying {string} should pop up") do |message|
  @expected_message = message
end

When("I want to click {string}") do |option|
  retval = (option == "Ok") ? "true" : "false"
end

Then("I should be on the {string} page") do |page_name|
  expect(page).to have_content(page_name)
end

Then("I should see the {string} field") do |field_name|
  expect(page).to have_field(field_name)
end

Then("I fill in {string} with {string}") do |field, value|
  fill_in(field, :with => value)
end

Then("I press {string}") do |option|
  retval = (option == "Ok") ? "true" : "false"
end

When("I click on the {string} link") do |page_name|
  click_link page_name
end