class Provider < ActiveRecord::Base
  belongs_to :user

  def self.from_omniauth(auth)
    where(name: auth["provider"], uid: auth["uid"], name: auth["info"]["name"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = User.create #this should be find user method or create
    create! do |provider|
      provider.name = auth["provider"]
      provider.uid = auth["uid"]
      provider.name = auth["info"]["name"]
      provider.user_id = user.id
    end
  end
end
