class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :content
  validates :user_id, presence: true

  def self.all_by_date
    all.sort { |a, b| a.created_at <=> b.created_at }
  end

  def self.recent_five
    all_by_date[0..4]
  end
end
