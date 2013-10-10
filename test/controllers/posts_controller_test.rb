require 'test_helper'

describe PostsController do
  describe '#create validations' do
    subject { Post.new(title: 'My post', content: 'Some content', admin_user_id: 1, validations: validations_for(:create)) }

    describe 'post title' do
      it { must have_valid(:title).when('My title') }
      it { wont have_valid(:title).when(nil, '') }
    end

    describe 'post content' do
      it { must have_valid(:content).when('Test content') }
      it { wont have_valid(:content).when(nil, '') }
    end
  end
end
