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
    self.user_id = user.id
  end

  def check_in(user)
    self.available = true
    self.user_id = nil
  end

  def belongs_to_user?(user)
    self.user_id == user
  end

  def self.check_due_date
    @unavailable_tools = Tool.where(available: false).where(due_date: (Time.now - 3.days..Time.now.midnight)
    @unavailable_tools.each do |unavailable_tool|
      Resque.enqueue(ToolReminder, unavailable_tool.id)
    end
  end
end
