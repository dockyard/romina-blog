require 'test_helper'

feature 'Authentication' do
  scenario 'signing in successfully' do
    visit root_path

    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'

    click_button 'Submit'

    current_path.must_equal root_path
    wont_have_content 'Sign up'
  end

  scenario 'signing in unsuccessfully' do
    visit root_path

    click_link 'Sign in'
    click_button 'Submit'

    current_path.must_equal sign_in_path
    must_have_content 'Sign in'
  end
end
