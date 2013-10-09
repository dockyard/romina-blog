require 'test_helper'

feature 'Signing up' do
  scenario 'signing up succesfully brings a user back to the home page' do
    visit root_path
    click_link 'Sign up'

    fill_in 'Email', with: 'test_user@example.com'
    fill_in('Password', with: 'password', :match => :prefer_exact)
    fill_in('Password confirmation', with: 'password', :match => :prefer_exact)
    page.select('reader', from: 'user_type')
    click_button 'Sign up'

    current_path.must_equal root_path
    wont_have_content 'Sign up'
  end

  scenario 'invalid user returns user to sign up page' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'

    current_path.must_equal sign_up_path
    wont_have_content 'User was invalid'
  end
end
