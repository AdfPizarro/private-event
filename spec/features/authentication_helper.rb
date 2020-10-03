# frozen_string_literal: true

module AuthenticationHelper
  def login_user
    visit new_session_path
    fill_in 'user_username', with: user.username
    click_button 'Login'
  end
end
