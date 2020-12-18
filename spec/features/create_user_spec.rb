require 'rails_helper'

RSpec.describe 'User create', type: :feature do
  scenario 'User creation' do
    visit new_user_registration_path
    fill_in 'user_name', with: 'lalo'
    fill_in 'user_email', with: 'lalo@new.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Hello,')
  end
end
