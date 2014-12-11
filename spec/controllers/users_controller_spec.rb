require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) { User.create(name: "Kate", email: "k@example.com") }

  # describe "GET email" do
  #   it "is successful" do
  #     session[:user_id] = user.id
  #     get :email, {id: current_user.id}
  #     expect(response).to eq 200
  #   end
  # end
  #
  # describe "POST add_email" do
  #   let(:request) { post :add_email, user:{email: "k@example.com"} }
  #   it "adds an email address" do
  #     request
  #     expect(user.email).to eq "k@example.com"
  #   end
  #
  #   it "redirects to the homepage if successful" do
  #     request
  #     expect(response).to redirect_to root_path
  #   end
  #
  #   it "renders the page if unsuccessful" do
  #     let(:request) { post :add_email, user:{email: "katexample.com"} }
  #     expect(response).to render :email
  #   end
  # end

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
