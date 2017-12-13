require 'rails_helper.rb'

feature"User sign in" do
    scenario "User successfully navigates to sign in page" do
        visit root_path
        expect(page).to have_content("Breakout! Try to destroy all of the blocks and get the highest score possible!")
        click_button "Sign in"
        expect(page).to have_content("Login")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        click_button "Log in"
    end
    
    scenario "user successfully sign in" do
        visit root_path
        expect(page).to have_content("Breakout! Try to destroy all of the blocks and get the highest score possible!")
        click_button "Sign in"
        fill_in "Email", with: "test@testing.com"
        fill_in "Password", with: "testing123"
        click_button "Log in"
        expect(page).to have_content("Login! Email Password New user? Sign up now! About Us Privacy Policy")
    end
end