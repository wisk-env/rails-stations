require 'rails_helper'

RSpec.describe "Admin::Theaters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/theaters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/theaters/new"
      expect(response).to have_http_status(:success)
    end
  end

end
