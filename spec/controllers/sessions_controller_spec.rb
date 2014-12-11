require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  # describe "POST create" do
  #   let(:request) {post :create, user: {email: "k@gmail.com"}}
  #   it "adds user to database" do
  #     expect {
  #       request
  #     }.to change{User.count}.by(1)
  #   end
  #
  #   it "renders the page if unsuccessful" do
  #     expect(response).to render :new
  #   end
  #
  #   it "redirects you to homepage if successcul" do
  #     request
  #     expect(response).to redirect_to root_path
  #   end
  #
  #   it "assigns user's id to session" do
  #     request
  #     expect(session[:user_id]).to eq assigns(:user).id
  #   end
  #
  #   describe "mailer" do
  #     it "delivers to the new user" do
  #       # {} = block because we need to do something before it runs
  #       expect { request }.to change(ActionMailer::Base.deliveries, :count).by(1)
  #     end
  #   end
  # end
end
