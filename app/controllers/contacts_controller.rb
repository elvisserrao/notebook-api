# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  def index
    page_number = params[:page].try(:[], :number)
    page_size = params[:page].try(:[], :size)
    @contacts = Contact.all.bonzo(page_number).per(page_size)

    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact, include: %i[kind address phones]
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: %i[kind]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.phones.destroy_all
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def contact_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
