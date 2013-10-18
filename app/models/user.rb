class User < ActiveRecord::Base
  include EasyAuth::Models::Account
  include ContextValidations::Model
  has_many :comments, dependent: :destroy

  def can_admin?(resource)
    resource.admin_user_id == self.id
  end

  def is_admin?
    AdminUser === self
  end
end
