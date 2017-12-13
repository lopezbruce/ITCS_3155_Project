Feature: Going to the game
  
  As a user
  I would like to get from the homepage to the game
  I want to be able to start the game
  
Scenario: As a new user I want to be able to navigate from the homepage to the game page
  Given I am on the home page
  When I click on the "Easy" button
  Then I should be on the "Breakout!" page
  When I click on the "Start" button
  And A confirmation box saying "Game Over" should pop up
  And I want to click "Ok"
  And A confirmation box saying "Score: 1" should pop up
  And I want to click "Ok"
  And A confirmation box saying "Unable to save score, please ensure you are logged in!" should pop up
  And I want to click "Ok"
  Then I should be on the "Breakout!" page
  When I click on the "🏠" button
  Then I should be on the "Welcome to Games!" page
  When I click on the "Medium" button
  Then I should be on the "Breakout!" page
  When I click on the "Start" button
  And A confirmation box saying "Game Over" should pop up
  And I want to click "Ok"
  And A confirmation box saying "Score: 1" should pop up
  And I want to click "Ok"
  And A confirmation box saying "Unable to save score, please ensure you are logged in!" should pop up
  And I want to click "Ok"
  Then I should be on the "Breakout!" page
  When I click on the "🏠" button
  Then I should be on the "Welcome to Games!" page
  When I click on the "Hard" button
  Then I should be on the "Breakout!" page
  When I click on the "Start" button
  And A confirmation box saying "Game Over" should pop up
  And I want to click "Ok"
  And A confirmation box saying "Score: 1" should pop up
  And I want to click "Ok"
  And A confirmation box saying "Unable to save score, please ensure you are logged in!" should pop up
  And I want to click "Ok"
  Then I should be on the "Breakout!" page
  When I click on the "🏠" button
  Then I should be on the "Welcome to Games!" page
  