# frozen_string_literal: true

class AddressesController < ApplicationController
    before_action :set_contact, only: %i[show update]

  #   # GET /addresses
  #   def index
  #     @contactes = Address.all

  #     render json: @contactes
  #   end

    # GET /contacts/1/address

    def show
      render json: @contact.address
    end

  #   # POST /contacts/1/address
  #   def create
  #     @contact = address.new(address_params)

  #     if @contact.save
  #       render json: @contact, status: :created, location: @contact
  #     else
  #       render json: @contact.errors, status: :unprocessable_entity
  #     end
  #   end

    # PATCH/PUT /contacts/1/address
    def update
      if @contact.address.update(address_params)
        render json: @contact.address
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

  #   # DELETE /contacts/1/address
  #   def destroy
  #     @contact.destroy
  #   end

  #   private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
