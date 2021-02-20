require 'rails_helper'

RSpec.describe "Customer::Orders", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/customer/orders/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/customer/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/customer/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirm" do
    it "returns http success" do
      get "/customer/orders/confirm"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /complete" do
    it "returns http success" do
      get "/customer/orders/complete"
      expect(response).to have_http_status(:success)
    end
  end

end
