# frozen_string_literal: true

class AddressesController < ApplicationController
    before_action :set_address, only: %i[show]

  #   # GET /addresses
  #   def index
  #     @addresses = Address.all

  #     render json: @addresses
  #   end

    # GET /addresses/1
    def show
      render json: @address
    end

  #   # POST /addresses
  #   def create
  #     @address = address.new(address_params)

  #     if @address.save
  #       render json: @address, status: :created, location: @address
  #     else
  #       render json: @address.errors, status: :unprocessable_entity
  #     end
  #   end

  #   # PATCH/PUT /addresses/1
  #   def update
  #     if @address.update(address_params)
  #       render json: @address
  #     else
  #       render json: @address.errors, status: :unprocessable_entity
  #     end
  #   end

  #   # DELETE /addresses/1
  #   def destroy
  #     @address.destroy
  #   end

  #   private

    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Contact.find(params[:contact_id]).address
    end

  #   # Only allow a trusted parameter "white list" through.
  #   def address_params
  #     params.require(:address).permit(:description)
  #   end
end