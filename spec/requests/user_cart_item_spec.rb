require 'rails_helper'

RSpec.describe "UserCartItems", type: :request do
  describe "GET /index" do
    xit "returns http success" do
      get "/user_cart_item/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    xit "returns http success" do
      get "/user_cart_item/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    xit "returns http success" do
      get "/user_cart_item/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /empty" do
    xit "returns http success" do
      get "/user_cart_item/empty"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /checkout" do
    xit "returns http success" do
      get "/user_cart_item/checkout"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    xit "returns http success" do
      get "/user_cart_item/create"
      expect(response).to have_http_status(:success)
    end
  end
end
