class ToolReminder
  @queue = :tool

  def self.perform(tool_id)
    tool = Tool.find(tool_id)
    UserMailer.tool_reminder(unavailable_tool).deliver
  end
end
