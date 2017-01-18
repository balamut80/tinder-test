require 'rails_helper'

feature 'Signing out' do

	scenario 'Existing user try to sign out' do
		User.create(email:'user@test.com', password: '12345678')

		visit new_user_session_path
		fill_in 'Email', with: 'user@test.com'
		fill_in 'Password', with: '12345678'
		click_on 'Sign in'
		click_on 'Logout'

		expect(page).to have_content 'Sign in'
	end

end