require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validates" do
    let(:user) { User.new(email: "b@example.com") }

    it "is valid with valid atttributes" do
      expect(user.valid?).to eq true
    end

    it "email address contains an @ symbol" do
      user.email = "batexample.com"
      expect(user.valid?).to eq false
    end
  end
end
