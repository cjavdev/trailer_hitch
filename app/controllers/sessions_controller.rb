class SessionsController < ApplicationController
  def create
    @user = User.find_with_omniauth(omniauth_hash)
    if !!@user
      login(@user)
      redirect_to root_url
    else
      flash[:errors] = ["Invalid login"]
      redirect_to '/pages/welcome'
    end
  end

  def omniauth_hash
    request.env['omniauth.auth']
  end
end
