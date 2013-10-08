class User < ActiveRecord::Base
  include EasyAuth::Models::Account
  include ContextValidations::Model
end
