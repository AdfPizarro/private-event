require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:user) { User.create name: 'test_name', username: 'test_username'  }

  scenario 'login' do
    visit new_session_path
    fill_in 'user_username', with: user.username
    click_button 'Login'
    expect(page).to have_content('Your Events')
  end

  scenario 'logout' do
    visit new_session_path
    fill_in 'user_username', with: user.username
    click_button 'Login'
    click_link 'Logout'
    expect(page).to have_current_path(new_session_path)
  end

  scenario 'sign_up' do
    visit new_user_path
    fill_in 'user_username', with: user.username
    fill_in 'user_name', with: user.name
    click_button 'Create User'
    expect(page).to have_content('Your Events')
  end
end
