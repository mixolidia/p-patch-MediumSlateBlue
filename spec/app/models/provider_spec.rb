require 'rails_helper'

RSpec.describe Provider, :type => :model do
  describe ".validations" do
    it "uid must be present" do
      expect(Provider.create(uid: nil, name: "twitter").valid?).to eq false
    end

    it "uid must be unique" do
    end

    it "provider name must be present" do
      expect(Provider.create(uid: "12345", name: nil).valid?).to eq false
    end
  end
end
