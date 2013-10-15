require 'test_helper'

describe CommentsController do
  describe '#create validations' do
    subject { Comment.new(validations: validations_for(:create)) }

    describe 'Comment content' do
      it { must have_valid(:content).when('Some content') }
      it { wont have_valid(:content).when(nil, '') }
    end
  end
end
