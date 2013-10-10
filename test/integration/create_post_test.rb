require 'test_helper'

feature 'Admin creates a post' do
  before do
    visit root_path
    click_link 'Sign up'

    fill_in 'Email', with: 'test_user@example.com'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    page.select 'AdminUser', from: 'user_type'
    click_button 'Sign up'
  end

  scenario 'they see new post in list of posts' do
    click_link 'New post'
    fill_in 'Title', with: 'My first post'
    fill_in 'Content', with: 'The content of my first post'
    click_button 'Submit'
    current_path.must_equal posts_path
    must_have_content 'My first post'
  end

  scenario 'post has invalid input' do
    click_link 'New post'
    click_button 'Submit'
    must_have_content 'Title', 'Content', 'Submit'
  end
end
