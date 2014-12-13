class NewPost
  @queue = :new_post

  def self.perform(post_id)
    most_recent = Post.find(post_id)
    UserMailer.new_post(most_recent).deliver
  end
end
