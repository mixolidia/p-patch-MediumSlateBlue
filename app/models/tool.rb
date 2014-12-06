class Tool < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true
  validates :available, :inclusion => {:in => [true, false]}
  validate :due_date_is_date?

  def due_date_is_date?
    unless due_date == nil
      if !due_date.respond_to?(:strftime)
        errors.add(:due_date, "must be a valid date")
      end
    end
  end

  def init
    self.available = true
  end

  def self.available_tools
    where(available: true)
  end

  def self.unavailable_tools
    where(available: false)
  end

  def set_due_date
    checkout_time = Time.now
    time_due = checkout_time + 1209600
    self.due_date = time_due
  end

  def check_out(user)
    self.available = false
    self.borrower = user.id
  end

  def check_in(user)
    self.available = true
    self.borrower = nil
  end

  def belongs_to_user?(user)
    self.borrower == user
  end
end
