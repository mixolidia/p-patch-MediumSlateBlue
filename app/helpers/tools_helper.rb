module ToolsHelper

  def format_time(due_date)
    due_date.strftime("%A, %B, %d, %Y")
  end

end
