require 'test_helper'

feature 'Admin deletes blog post when signed in' do
  before do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'
  end

  scenario 'post is no longer available' do
    click_link 'MyPost'
    click_link 'Delete'
    current_path.must_equal posts_path
    page.wont_have_content 'MyPost'
  end
end
