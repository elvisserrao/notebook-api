# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city
  belongs_to :contact do
    link(:related) { contact_url(object.contact.id) }
  end
end
