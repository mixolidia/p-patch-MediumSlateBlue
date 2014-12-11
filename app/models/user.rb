class User < ActiveRecord::Base
  has_many :providers
  has_many :tools
  has_many :posts

  validates :email, format: {with: /@/}

  def self.create_from_omniauth(auth)
    user = User.new #cleaner way of doing this?
    user.name = auth["info"]["name"]
    user.administrator = false
    user.save
  end

  def user_is_admin?
    self.administrator == true
  end

  def make_admin
    self.administrator = true
  end

  def my_tools
    @tools = Tool.where( user_id: self.id )
  end

  def members
  end

  def author(post)
    self.id == post.user_id
  end

end
