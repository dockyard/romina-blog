require 'test_helper'

feature 'Home page' do
  scenario 'can reach the home page' do
    visit root_path
    assert true
  end
end
