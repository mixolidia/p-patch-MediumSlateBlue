class Tool < ActiveRecord::Base
  validates :name, presence: true
  validates :available, :inclusion => {:in => [true, false]}
end
