# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind

  has_many :phones
  accepts_nested_attributes_for :phones, reject_if: ->(attributes){ attributes['number'].blank? }, allow_destroy: true

  def kind_description
    return unless kind

    kind.description
  end

  def phone_numbers
    return unless phones

    phones.map do |phone|
      phone.number
    end
  end

  def birth_date
    I18n.l(birthdate) unless birthdate.blank?
  end

  # def to_br
  #   {
  #     name: name,
  #     email: email,
  #     birthdate: (I18n.l(birthdate) unless birthdate.blank?)

  #   }
  # end

  def as_json(_options = {})
    super(
      only: %i[name email],
      methods: %i[birth_date kind_description phone_numbers]
    )
  end
end
