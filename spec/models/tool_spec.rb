require 'rails_helper'

RSpec.describe Tool, :type => :model do
  describe ".validations" do
    it "must have a name" do
      expect(Tool.create(name: nil).valid?).to eq false
    end

    it "availability should be a boolean" do
      expect(Tool.create(name: "shovel", available: 3).valid?).to eq false
    end
  end
end
