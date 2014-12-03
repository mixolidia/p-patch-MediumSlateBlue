class User < ActiveRecord::Base
  has_many :providers

  def self.create_with_omniauth(auth)
    user = User.new #cleaner way of doing this?
    user.name = auth["info"]["name"]
    user.administrator = false
    user.save
  end
end
