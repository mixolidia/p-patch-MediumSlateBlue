class UsersController < ApplicationController

  def show
    #@user = User.find(current_user.id)
    @tools = Tool.where( user_id: current_user.id )
  end

  def admin
    @members = User.all
  end

  def email
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @user.email = params[:user][:email]
    if @user.save
      #UserMailer.sign_up(@user.id).deliver
      redirect_to root_path
    else
      render :add_email, {:notice => "Unable to save email."}
    end
  end
end
