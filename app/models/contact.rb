# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind

  has_one :address, dependent: :destroy
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :phones, reject_if: ->(attributes) { attributes['number'].blank? }, allow_destroy: true

  def kind_description
    return unless kind

    kind.description
  end

  def phone_numbers
    return unless phones

    phones.map(&:number)
  end

  def birth_date
    I18n.l(birthdate) unless birthdate.blank?
  end
end
