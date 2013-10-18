require 'test_helper'

describe Post do
  @post = Post.create(title: 'My Post', content: 'Some content')
  @post.destroy

  describe '#destroyed' do
    it 'should return deleted post' do
      Post.destroyed.wont_equal(nil)
    end
  end
end
