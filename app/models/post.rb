class Post < ActiveRecord::Base
  include ContextValidations::Model
  belongs_to :admin_user
end
