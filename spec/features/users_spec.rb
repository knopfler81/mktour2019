require 'rails_helper'

RSpec.describe "Users" , :js do 


	context "create an account" do 

		scenario "user can create an account" do 
			visit  new_user_registration_path
			fill_in "user[email]", with: "johan@example.com"
			fill_in "user[first_name]", with: "Johan"
			fill_in "user[last_name]", with: "Doe"
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"

			click_on 'Valider inscription'
			#save_and_open_page
			expect(page).to have_content("Welcome! You have signed up successfully.")

		end
	end
end

