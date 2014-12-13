class HomeController < ApplicationController

  def index
    @posts = Post.recent_three
    #@events = Event.recent_three
  end

end
