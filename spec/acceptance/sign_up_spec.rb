require 'rails_helper'

feature 'Signing up' do

	scenario 'New user tries sign up' do

		visit new_user_registration_path
		fill_in 'Email', with: 'test@test.com'
		fill_in 'Password', with: '12345678'
		fill_in 'Password confirmation', with: '12345678'
		click_on 'Sign up'

		expect(current_path).to eq root_path
	end

	scenario 'Already registered user tries to sign up' do
		User.create(email:'user@test.com', password: '12345678')

		visit new_user_registration_path
		fill_in 'Email', with: 'user@test.com'
		fill_in 'Password', with: '12345678'
		fill_in 'Password confirmation', with: '12345678'
		click_on 'Sign up'

		expect(page).to have_content 'Email has already been taken'
	end

end