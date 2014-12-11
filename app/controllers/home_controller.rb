class HomeController < ApplicationController

  def index
    @posts = Post.recent_five
    #@events = Event.recent_five
  end

end
