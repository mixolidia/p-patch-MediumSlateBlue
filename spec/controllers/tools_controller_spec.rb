require 'rails_helper'

RSpec.describe ToolsController, :type => :controller do

  describe "POST create" do
    it "creates a new tool in the database" do
      expect {
        post :create, {tool:{name: "shovel"}}
      }.to change{Tool.count}.by(1)
    end

    it "sets available attribute to true" do
      post :create, {tool:{name: "shovel"}}
      expect(Tool.find_by(name: "shovel").available).to eq true
    end
  end

  describe "POST destroy" do
    it "removes a tool from the database" do
      tool = Tool.create(name: "shovel", available: false)
      expect {
        post :destroy, {id: tool.id}
      }.to change{Tool.count}.by(-1)
    end
  end

  # describe "POST check_out" do
  #   context "if there is a vaild current user" do
  #     it "a user can check out a tool from library" do
  #       user = User.create!
  #       session[:user_id] = user.id
  #
  #       tool = Tool.create!(name: "shovel", available: true)
  #       post :check_out, {id: tool.id}
  #       expect(tool.available).to eq false
  #     end
  #
  #
  #     it "has a due date" do
  #     end
  #   end
  #
  #   context "if there is no valid current user" do
  #     it "a user cannot check out a tool and redirected" do
  #       subject { post :check_out, {id: tool.id} }
  #
  #       tool = Tool.create!(name: "shovel", available: true)
  #       session[:user_id] = nil
  #
  #       expect(session[:user_id]).to eq nil
  #       expect(subject).to redirect_to root_path
  #     end
  #   end
  # end

  describe "POST check_in" do
    context "with valid attributes" do
      it "user id matches borrower attribute value" do
        #makes sure session[:user_id] matches borrower: user.id
      end

      it "the tool is checked back in" do
        # user = User.create!
        # tool = Tool.create!(
        #           name: "shovel",
        #           available: false,
        #           borrower: user.id)
        # post :check_in, {id: tool.id}
        # expect(tool.borrower).to eq nil
        # expect(tool.available).to eq true
      end
    end
  end
end
