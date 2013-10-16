require 'test_helper'

feature 'user comments on a post when signed in' do

  before do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Submit'
    click_link 'MyPost'
  end

  scenario 'comment with valid input' do
   fill_in 'comment_content', with: 'Nice blog post'
   click_button 'Submit'
   wont_have_content 'can\'t be blank'
   must_have_content 'Nice blog post'
  end

  scenario 'comment with invalid input' do
    click_button 'Submit'
    must_have_content 'can\'t be blank'
  end
end
