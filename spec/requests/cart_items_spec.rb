require 'rails_helper'

RSpec.describe "CartItems", type: :request do
  describe "GET /create" do
    xit "returns http success" do
      get "/cart_items/create"
      expect(response).to have_http_status(:success)
    end
  end
end
