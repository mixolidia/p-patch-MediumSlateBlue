require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "signing out" do
    it "can sign user's out of the application" do
      session[:user_id] = 4
      post :destroy
      expect(session[:user_id]).to eq nil
    end
  end
end
