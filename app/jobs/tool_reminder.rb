class ToolReminder
  @queue = :tool

  def self.perform(tool_id)
    due_tool = Tool.find(tool_id)
    UserMailer.tool_reminder(due_tool).deliver
  end
end
