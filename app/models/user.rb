class User < ActiveRecord::Base
  include EasyAuth::Models::Account
  include ContextValidations::Model
  has_many :comments, dependent: :destroy

  def can_admin?(post)
    post.admin_user_id == self.id
  end
end
