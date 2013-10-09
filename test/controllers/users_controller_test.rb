require 'test_helper'

describe UsersController do
  describe '#create validations' do
    subject { User.new(password: 'password', type: 'AdminUser', validations: validations_for(:create))}

    it { must have_valid(:email).when('test_user@example.com') }
    it { wont have_valid(:email).when(nil, '') }

    describe 'unique email' do
      it { wont have_valid(:email).when('test@example.com') }
    end

    describe 'password' do
      it { must have_valid(:password).when('password') }
      it { wont have_valid(:password).when(nil, '') }
      it { must have_valid(:password_confirmation).when('password') }
      it { wont have_valid(:password_confirmation).when('otherpassword', '') }
    end

    describe 'type' do
      it { must have_valid(:type).when('ReaderUser', 'AdminUser') }
    end
  end
end
