class Post < ActiveRecord::Base
  include ContextValidations::Model
  include DestroyedAt
  belongs_to :admin_user
  has_many :comments, dependent: :destroy
end
