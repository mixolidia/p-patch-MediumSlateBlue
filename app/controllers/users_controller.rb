class UsersController < ApplicationController

  def show
    #@user = User.find(current_user.id)
    @tools = Tool.where( user_id: current_user.id )
  end

  def admin
    @members = User.all
  end

  def create
    @user.email = (params[:email])
    @user.save
    UserMailer.sign_up(@user.id).deliver
    session[:user_id] = @user.id
    redirect_to root_path
  end

end
