require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  # describe "POST create" do
  #   let(:request) {post :create, user: {email: "k@gmail.com"}}
  #   it "adds user to database" do
  #     expect {
  #     request
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
  # end
  #
  # describe "GET show" do
  #   let(:user) { User.create(email: "b@example.com") }
  #
  #   it "is successful" do
  #     session[:user_id] = user.id
  #     get :show, {id: current_user.id}
  #     expect(response).to eq 200
  #   end
  # end
end
