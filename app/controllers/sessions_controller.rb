class SessionsController < ApplicationController
  include EasyAuth::Controllers::Sessions

  def after_successful_sign_in_url_default
    root_path
  end
end
