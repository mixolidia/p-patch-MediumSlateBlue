class Tool < ActiveRecord::Base
  validates :name, presence: true
  validates :available, :inclusion => {:in => [true, false]}
  # validate :due_date_is_date?

  # def due_date_is_date?
  #   if !due_date.is_a?(Date)
  #     errors.add(:due_date, "must be a valid date")
  #   end
  # end

end
