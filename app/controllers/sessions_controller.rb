class SessionsController < ApplicationController

  def create
    auth = env["omniauth.auth"]
    provider = Provider.from_omniauth(auth)
    session[:user_id] = provider.user_id
    user = User.find(session[:user_id])
    if user.email.nil?
      redirect_to email_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
