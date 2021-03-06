require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #synestesie" do
    it "returns http success" do
      get :synestesie
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #start" do
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #legal" do
    it "returns http success" do
      get :legal
      expect(response).to have_http_status(:success)
    end
  end

end
