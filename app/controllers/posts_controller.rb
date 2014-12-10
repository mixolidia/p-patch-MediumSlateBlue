class PostsController < ApplicationController

  def create
    @post = Post.new(post_params) #params[:post]
    @post.user_id = current_user.id
    @post.save!

    redirect_to post_path(@post.title)
  end

  def new
    @post = Post.new
  end

  def posts
    @posts = Post.all
  end

  def post
    @post = Post.find_by(title: params[:title])

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
