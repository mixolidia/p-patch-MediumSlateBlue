class UsersController < ApplicationController

  def show
    #@user = User.find(current_user.id)
    @tools = Tool.where( user_id: current_user.id )
  end

  def admin
    @members = User.all
  end

end
