class UsersController < ApplicationController

  def show
    @tools = Tool.where( borrower: current_user.id )
  end

  def admin
    @members = User.all
  end

end
