require 'rails_helper.rb'

feature"User check score" do
    scenario "user successfully sign in" do
        visit root_path
        expect(page).to have_content("Breakout! Try to destroy all of the blocks and get the highest score possible!")
        click_button "Sign in"
        fill_in "Email", with: "test@testing.com"
        fill_in "Password", with: "testing123"
        find_button('Log in').click
        expect(page).to have_content("Login! Email Password New user? Sign up now! About Us Privacy Policy")
    end
    
    scenario "User click on highscore" do
        visit root_path
        expect(page).to have_content("Breakout! Try to destroy all of the blocks and get the highest score possible!")
        click_link "Highscore"
        expect(page).to have_content("Easy Highscores")
        click_button "🏠"
        
    end
end