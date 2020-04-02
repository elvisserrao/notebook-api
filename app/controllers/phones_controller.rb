# frozen_string_literal: true

class PhonesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_contact, only: %i[create show update destroy]
  before_action :set_phone, only: %i[display update destroy]

  # GET /contacts/1/phone/1
  def display
    render json: @phone
  end

  # GET /contacts/1/phones
  def show
    render json: @contact.phones
  end

  # POST /contacts/1/phone
  def create
    @contact.phones << Phone.new(phone_params)

    if @contact.phones.last.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1/phone or PATCH/PUT /contacts/1/phone/1
  def update
    if @phone.update(phone_params)
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1/phone or DELETE /contacts/1/phone/1
  def destroy
    @phone.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def set_phone
    @phone = if phone_params
               Phone.find(params[:id])
             else
               Phone.find(phone_params[:id])
             end
  end

  # Only allow a trusted parameter "white list" through.
  def phone_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
