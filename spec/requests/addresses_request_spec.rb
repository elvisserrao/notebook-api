require 'rails_helper'

RSpec.describe "Addresses", type: :request do
    headers = { "Accept" => "application/vnd.api+json" }
    contact = Contact.last

    describe "GET /contacts/:contact_id/address" do
      it "returns http success" do
        get "/contacts/#{contact.id}/address", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET /contacts/:contact_id/address" do
      it "returns http not acceptable" do
        get "/contacts/#{contact.id}/address"
        expect(response).to have_http_status(:not_acceptable)
      end
    end

    describe "POST /contacts/:contact_id/address" do
      it "returns http success" do
        headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "Application/json" }
        post "/contacts/#{contact.id}/address", :headers => headers
        expect(response).to have_http_status(:success)
      end
    end
  

end
