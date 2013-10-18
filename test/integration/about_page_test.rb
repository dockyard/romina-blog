require 'test_helper'

feature 'User wants to see about me page' do
  scenario 'user clicks on About button and content appears' do
    visit root_path
    click_link 'About'
    current_path.must_equal about_path
  end
end
