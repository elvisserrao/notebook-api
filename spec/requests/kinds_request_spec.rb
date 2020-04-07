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

    describe "GET /kinds/:id" do
      it "returns http success" do
        contact = Contact.last
        get "/kinds", params: { id: contact.id } , :headers => headers
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST /kinds" do
      it "returns http created" do
        headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "Application/json" }
        body = {"data"=>{"type"=>"kinds", "attributes"=>{"description"=>"Teste"}}}.to_json

        post "/kinds", :headers => headers, params: body
        expect(response).to have_http_status(:created)
      end
    end

    describe "POST /kinds" do
      it "returns http unprocessable_entity" do
        headers = { "Accept" => "application/vnd.api+json", "Content-Type" => "Application/json" }
        body = {"data"=>{"type"=>"kinds", "attributes"=>{"description"=>""}}}.to_json

        post "/kinds", :headers => headers, params: body
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end


end
