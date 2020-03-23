# frozen_string_literal: true

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  link(:self) { contact_url(object) }

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

  meta do
    {
      author: 'Elvis Serrão'
    }
  end

  def attributes(*args)
    h = super(*args)
    # h[:birthdate]= (I18n.l(object.birthdate)) unless object.birthdate.blank?
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
