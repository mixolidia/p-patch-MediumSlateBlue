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

    it "only admin can add tools to library" do
      user = User.create!
      user.administrator = false
      session[:user_id] = user.id

      expect {
        post :create, {tool:{name: "shovel"}}
      }.to change{Tool.count}.by(0)
    end
  end

  describe "POST destroy" do
    it "removes a tool from the database" do
      tool = Tool.create(name: "shovel", available: false)
      expect {
        post :destroy, {id: tool.id}
      }.to change{Tool.count}.by(-1)
    end

    it "only admin can remove tools from library" do
      user = User.create!
      user.administrator = false
      session[:user_id] = user.id

      expect {
        post :create, {tool:{name: "shovel"}}
      }.to change{Tool.count}.by(0)
    end
  end

  describe "POST check_out" do
    context "if there is a vaild current user" do
      it "a user can check out a tool from library" do
        user = User.create!
        session[:user_id] = user.id

        tool = Tool.create!(name: "shovel", available: true, due_date: nil)
        post :check_out, {id: tool.id}

        expect(tool.reload.available).to eq false
      end

      it "tool can be checked out only if it is available" do
        user = User.create!
        session[:user_id] = user.id

        tool = Tool.create!(name: "shovel", available: false, due_date: nil, borrower: 7)
        post :check_out, {id: tool.id}

        expect(tool.reload.borrower).to eq 7
      end

      it "has a due date" do
        user = User.create!
        session[:user_id] = user.id

        tool = Tool.create!(name: "shovel", available: true, due_date: nil)
        post :check_out, {id: tool.id}

        expect(tool.reload.due_date).to_not eq nil
      end
    end


    context "if there is no valid current user" do
      it "a user cannot check out a tool and redirected" do
        subject { post :check_out, {id: tool.id} }

        tool = Tool.create!(name: "shovel", available: true)
        session[:user_id] = nil

        expect(session[:user_id]).to eq nil
        expect(tool.reload.available).to eq true
        #expect(subject).to redirect_to root_path
      end
    end
  end

  describe "POST check_in" do
    context "with valid attributes" do
      it "user id matches borrower attribute value" do
        user = User.create!
        session[:user_id] = user.id

        tool = Tool.create!(name: "shovel", available: false, due_date: Time.now, borrower: user.id)
        post :check_in, {id: tool.id}

        expect(tool.reload.available).to eq true
      end

      it "tool can only be checked in if it's been checked out" do
        user = User.create!
        session[:user_id] = user.id

        tool = Tool.create!(name: "shovel", available: true, due_date: nil, borrower: nil)
        post :check_in, {id: tool.id}

        #expect error??
        #expect(tool.reload.available).to eq true
      end

      it "tool is checked back in" do
        user = User.create!
        tool = Tool.create!(
                  name: "shovel",
                  available: false,
                  borrower: user.id)
        post :check_in, {id: tool.id}
        expect(tool.reload.borrower).to eq nil
        expect(tool.reload.available).to eq true
      end
    end

    context "with invalid attributes" do
      it "tool will not be checked in" do
        user = User.create!
        session[:user_id] = user.id

        tool = Tool.create!(
                  name: "shovel",
                  available: false,
                  borrower: user.id + 1)

        expect(tool.reload.available).to eq false
      end
    end
  end
end