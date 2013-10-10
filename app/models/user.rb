class User < ActiveRecord::Base
  include EasyAuth::Models::Account
  include ContextValidations::Model
  has_many :comments, dependent: :destroy
end
