require 'rails_helper'

RSpec.describe "Admin::Orders", type: :request do

<<<<<<< HEAD
  describe "GET /index" do
    it "returns http success" do
      get "/admin/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

=======
>>>>>>> origin/develop
end
