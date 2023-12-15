# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    authorization
  end

  private
  def authorization
    @user = User.from_omniauth(request.env["amniauth.auth"])
    if @user.persisted? #ログイン処理を行う
      sign_in_and_redirect @user, event: :authentication
    else
      render template: 'devise/registrations/new'
    end
  end
end
