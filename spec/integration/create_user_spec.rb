require 'rails_helper.rb'

feature"user adds a stat" do
    scenario "User successfully navigates to sign in page" do
        visit root_path
        expect(page).to have_content("Breakout! Try to destroy all of the blocks and get the highest score possible!")
        click_button "Sign in"
        expect(page).to have_content("Login")
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
    end
    
    scenario "user successfully sign in" do
        visit root_path
        expect(page).to have_content("Breakout! Try to destroy all of the blocks and get the highest score possible!")
        click_button "Sign in"
        fill_in "Email", with: "test@testing.com"
        fill_in "Password", with: "testing123"
        click_button "Log in"
        #expect(page).to have_field("text")
    end
end