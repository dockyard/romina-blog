require 'test_helper'

feature 'Posts list appears on homepage' do
  before do
    Post.create(title: 'Post one', content: 'Some content')
    Post.create(title: 'Post two', content: 'More content')
    Post.create(title: 'Post three', content: 'Some more content')
  end

  scenario 'visitor sees all available blog posts' do
    visit root_path
    must_have_content 'Post one', 'Post two', 'Post three'
  end
end
