class Calendar < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar
end
