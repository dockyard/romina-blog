require 'test_helper'

feature 'Post is read' do
  before do
    user = User.create(email: 'test@example.com', password: 'password', type: 'AdminUser')
    user.posts.create(title: 'My post', content: 'Test content')
    visit root_path
  end

  scenario 'user clicks on post and is able to read the post' do
    click_link 'My post'
    must_have_content 'Test content'
  end
end
