class Provider < ActiveRecord::Base
  belongs_to :user

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(name: auth["provider"], uid: auth["uid"], name: auth["info"]["name"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    #User.create_from_omniauth(auth)
    #cleaner way of doing this?
    if !current_user
      user = User.new
      user.name = auth["info"]["name"]
      user.administrator = false
      user.save
    else
      user.id = current_user.id
    end

    create! do |provider|
      provider.name = auth["provider"]
      provider.uid = auth["uid"]
      provider.name = auth["info"]["name"]
      provider.user_id = user.id
    end

  end
end
