class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def sign_up(user_id)
    @user = User.find(user_id)
    mail(
      to: [@user.email, "from@example.com"],
      subject: "Welcome!"
    )
  end

end
