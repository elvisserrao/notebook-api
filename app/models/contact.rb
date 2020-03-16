# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind

  has_many :phones

  def kind_description
    return unless kind

    kind.description
  end

  def to_br
    {
      name: name,
      email: email,
      birthdate: (I18n.l(birthdate) unless birthdate.blank?)
    }
  end

  def as_json(_options = {})
    super(
      only: %i[name email],
      methods: %i[kind_description]
    )
  end
end
