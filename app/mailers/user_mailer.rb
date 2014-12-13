class UserMailer < ActionMailer::Base
  default from: "AdaGardenCollective@example.com"
  add_template_helper(ToolsHelper)

  def sign_up(user_id)
    @user = User.find(user_id)
    mail(
      to: [@user.email, "AdaGardenCollective@example.com"],
      subject: "Welcome!"
    )
  end

  def tool_reminder(due_tool)
    @tool = due_tool
    @user = User.find(due_tool.user_id)
    mail(
      to: [@user.email, "AdaGardenCollective@example.com"],
      subject: "Reminder"
    )
  end

  def all_emails
    @users = User.all
    @emails = []
    @users.each do |user|
      @emails << user.email
    end
  end

  def new_post(most_recent)
    @post = most_recent
    mail(
      bcc: @emails,
      subject: "Garden News"
    )
  end
end
