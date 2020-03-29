# frozen_string_literal: true

class PhonesController < ApplicationController
  before_action :set_phones, only: %i[show]

  # # GET /phones
  # def index
  #   @phones = Phone.all

  #   render json: @phones
  # end

  # GET /phones/1
  def show
    render json: @phones
  end

  # # POST /phones
  # def create
  #   @phone = Phone.new(phone_params)

  #   if @phone.save
  #     render json: @phone, status: :created, location: @phone
  #   else
  #     render json: @phone.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /phones/1
  # def update
  #   if @phone.update(phone_params)
  #     render json: @phone
  #   else
  #     render json: @phone.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /phones/1
  # def destroy
  #   @phone.destroy
  # end

  # private

  # Use callbacks to share common setup or constraints between actions.
  def set_phones
    @phones = Contact.find(params[:contact_id]).phones
  end

  # # Only allow a trusted parameter "white list" through.
  # def phone_params
  #   ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  # end
end
