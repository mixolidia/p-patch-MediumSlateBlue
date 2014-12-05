class User < ActiveRecord::Base
  has_many :providers

  def self.create_from_omniauth(auth)
    user = User.new #cleaner way of doing this?
    user.name = auth["info"]["name"]
    user.administrator = false
    user.save
  end

  def user_is_admin?
    raise
    self.administrator == true
  end

  def admin(current_user)
    user.administrator = true
  end

end
