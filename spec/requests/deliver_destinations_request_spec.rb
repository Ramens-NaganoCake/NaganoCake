require 'rails_helper'

RSpec.describe "DeliverDestinations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/deliver_destinations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/deliver_destinations/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
