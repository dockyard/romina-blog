class Post < ActiveRecord::Base
  include ContextValidations::Model
  belongs_to :admin_user
  has_many :comments, dependent: :destroy
end
