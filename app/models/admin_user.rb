class AdminUser < User
  has_many :posts, dependent: :destroy
end
