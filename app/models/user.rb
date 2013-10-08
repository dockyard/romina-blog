class User < ActiveRecord::Base
  include EasyAuth::Models::Account
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
end
