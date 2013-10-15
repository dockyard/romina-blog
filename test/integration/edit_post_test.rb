require 'test_helper'

feature 'Admin edits blog post when signed in' do

  before do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'
  end

  scenario 'updates should appear for the post' do
    click_link 'MyPost'
    click_link 'Edit'
    fill_in 'Title', with: 'New Title'
    fill_in 'Content', with: 'Edited content'
    click_button 'Submit'
    current_path.must_equal posts_path
    must_have_content 'New Title'
    wont_have_content 'MyPost'
    click_link 'New Title'
    must_have_content 'Edited content'
    wont_have_content 'MyText'
  end

  scenario 'updates with invalid input will not update' do
    click_link 'MyPost'
    click_link 'Edit'
    fill_in 'Title', with: ''
    fill_in 'Content', with: ''
    click_button 'Submit'
    must_have_content 'can\'t be blank'
  end
end
