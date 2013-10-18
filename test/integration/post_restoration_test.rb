require 'test_helper'

feature 'Admin restores previously deleted post when signed in' do
  before do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'
    click_link 'MyPost'
    click_link 'Delete'
  end

  scenario 'post appears on posts lists' do
    visit root_path
    page.wont_have_content 'MyPost'
    click_link 'Deleted posts'
    click_link 'Restore'
    current_path.must_equal posts_path
    page.must_have_content 'MyPost'
  end
end
