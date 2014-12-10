class UsersController < ApplicationController

  def show
    @tools = Tool.where( user_id: current_user.id )
  end

  def admin
    @members = User.all
  end

end
