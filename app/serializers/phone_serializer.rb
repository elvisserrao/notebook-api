# frozen_string_literal: true

class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number
  belongs_to :contact do
    link(:related) { contact_url(object.contact.id) }
  end
end
