require 'rails_helper'


describe "Contacts", type: :request do
  headers = { "Accept" => "application/vnd.api+json" }
  contact = Contact.last

  describe "GET /contacts" do
    it "returns http success" do
      get "/contacts", :headers => headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contacts" do
    it "returns http not acceptable" do
      get "/contacts"
      expect(response).to have_http_status(:not_acceptable)
    end
  end

  describe "GET /contacts/:id" do
    it "returns http success" do
      get "/contacts/#{contact.id}", :headers => headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contacts/:id/phones" do
    it "returns http success" do
      get "/contacts/#{contact.id}/phones", :headers => headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contacts/:id/address" do
    it "returns http success" do

      get "/contacts/#{contact.id}/address", :headers => headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /contacts" do
    it "returns http success" do
      headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "Application/json" }
      post "/contacts", :headers => headers
      expect(response).to have_http_status(:success)
    end
  end

end
