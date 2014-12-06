require 'rails_helper'

RSpec.describe Tool, :type => :model do
  describe ".validations" do
    it "must have a name" do
      expect(Tool.create(name: nil).valid?).to eq false
    end

    it "availability should be a boolean" do
      expect(Tool.create(name: "shovel", available: false).valid?).to eq true
      expect(Tool.create(name: "shovel", available: true).valid?).to eq true
    end
  end
end
