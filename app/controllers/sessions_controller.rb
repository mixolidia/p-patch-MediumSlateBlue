class SessionsController < ApplicationController

  def create
    auth = env["omniauth.auth"]
    provider = Provider.from_omniauth(auth)
    session[:user_id] = provider.user_id
    set_current_user #is this right? shouldn't be necessary?
    redirect_to root_path
  end

  def destroy
  end
  
end
