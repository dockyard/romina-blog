class UsersController < ApplicationController
  include ContextValidations::Controller

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.validations = validations

    if @user.save
      @user.password_identities.reload
      session[:identity_id] = @user.password_identities.first.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :type)
  end

  def base_validations
    validates :email, presence: true, uniqueness: true
  end

  def create_validations
    validates :password, presence: true, confirmation: true
  end
end
