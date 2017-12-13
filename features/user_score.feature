  Feature: Sign in and creating a score
  
    As a user
    I would like to sign in and get my scores
    I want to see my scores
  
  Scenario: As a new user I want to be able to navigate from the sign in page to see my scores
    Given I am on the home page
    When I click on the "Log in" link
    Then I should be on the "Login!" page
    And I fill in "Email" with "test@testing.com"
    And I fill in "Password" with "testing123"
    And I click on the "Log in" button
    Then I should be on the "Login! Email Password New user? Sign up now! About Us Privacy" page
    When I click on the "🏠" button