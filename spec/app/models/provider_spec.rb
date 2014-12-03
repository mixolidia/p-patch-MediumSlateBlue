require 'rails_helper'

RSpec.describe Provider, :type => :model do
  describe ".validations" do
    it "uid must be present" do
      expect(Provider.create(uid: nil).valid?).to eq false
    end
  end
end
