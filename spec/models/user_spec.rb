require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validates" do
    it "email address contains an @ symbol" do
      user = User.new(email: "batexmaple.com")
      expect(user.valid?).to eq false
    end
  end
end
