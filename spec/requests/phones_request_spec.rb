require 'rails_helper'

RSpec.describe "Phones", type: :request do
    headers = { "Accept" => "application/vnd.api+json" }
  
    describe "GET /contacts/1/phones" do
      it "returns http success" do
        get "/contacts/1/phones", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET /contacts/1/phones" do
      it "returns http not acceptable" do
        get "/contacts/1/phones"
        expect(response).to have_http_status(:not_acceptable)
      end
    end
  
    describe "GET /contacts/1/phone/1" do
      it "returns http success" do
        get "/contacts/1/phone/1", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "POST /contacts/1/phone" do
      it "returns http success" do
        headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "Application/json" }
        post "/contacts/1/phone", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  

end
