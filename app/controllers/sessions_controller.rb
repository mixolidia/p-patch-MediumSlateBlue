class SessionsController < ApplicationController

  def create
    auth = env["omniauth.auth"]
    provider = Provider.from_omniauth(auth)
    session[:user_id] = provider.user_id
    redirect_to root_path
  end

end
