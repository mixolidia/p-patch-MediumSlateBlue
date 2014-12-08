class PostsController < ApplicationController

  def posts
    @posts = Post.all
  end
end
