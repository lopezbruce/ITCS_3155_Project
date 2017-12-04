Feature: Add a new user entry
  
  As a user
  I would like to create a new account in order to save my highscore
  I want to be able to add a new user entry
  
Scenario: As a new user I want to be able to navigate from the homepage to the signup form
  Given I am on the home page
  When I click on the "Sign in" link
  Then I should be on the "User#index" page
  When I click on the "New" link
  Then I should be on the "New User Signup!" page
  And I should see the "Username" field
  And I should see the "Email" field
  And I should see the "Password" field
  And I should see the "Confirmation" field