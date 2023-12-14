# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    authorization
  end

  private
  def authorization
    @user = User.from_omniauth(request.env["amniauth.auth"])
  end
end
