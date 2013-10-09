require 'test_helper'

describe User do
  subject { User.new(password: 'password', type: 'AdminUser')}
  # Test for password, password_confirmation, email uniqueness

  it { must have_valid(:email).when('test_user@example.com') }
  it { wont have_valid(:email).when(nil, '') }

  context 'unique email' do
    it { wont have_valid(:email).when('test@example.com') }
  end

  context 'password' do
    it { must have_valid(:password).when('password') }
    it { wont have_valid(:password).when(nil, '') }
    it { must have_valid(:password_confirmation).when('password') }
    it { wont have_valid(:password_confirmation).when('otherpassword', '') }
  end

  context 'type' do
    it { must have_valid(:type).when('ReaderUser', 'AdminUser') }
    it { wont have_valid(:type).when(nil, '') }
  end
end
