class Comment < ActiveRecord::Base
  include ContextValidations::Model
  belongs_to :post
  belongs_to :user
end
