require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "sign up" do
    it "the to field has a user's email address" do
      user = User.create(email: "k@example.com")
      mailer = UserMailer.sign_up(user.id)
      expect(mailer.to).to include "k@example.com"
    end

    it "includes username within email body" do
      user = User.create(email: "k@example.com", name: "Pineapple")
      mailer = UserMailer.sign_up(user.id)
      expect(mailer.body.to_s).to match (/Hello Pineapple/)
    end
  end
end
