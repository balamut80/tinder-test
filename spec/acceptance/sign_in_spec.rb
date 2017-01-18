require 'rails_helper'

feature 'Signing in' do
	scenario 'Existing user try to sign in' do
		User.create(email:'user@test.com', password: '12345678')

		visit new_user_session_path
		fill_in 'Email', with: 'user@test.com'
		fill_in 'Password', with: '12345678'
		click_on 'Sign in'

		expect(current_path).to eq root_path
	end

	scenario 'Non-existing user try to sign in' do
		visit new_user_session_path
		fill_in 'Email', with: 'wrong@user.com'
		fill_in 'Password', with: '12345678'
		click_on 'Sign in'

		expect(page).to have_content 'Sign in'
	end
end