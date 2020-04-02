require 'rails_helper'

RSpec.describe "Kinds", type: :request do
    headers = { "Accept" => "application/vnd.api+json" }
  
    describe "GET /kinds" do
      it "returns http success" do
        get "/kinds", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET /kinds" do
      it "returns http not acceptable" do
        get "/kinds"
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  
    describe "GET /kinds/1" do
      it "returns http success" do
        get "/kinds/1", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "POST /kinds" do
      it "returns http success" do
        headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "Application/json" }
        post "/kinds", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  
  
end
