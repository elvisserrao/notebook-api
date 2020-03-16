# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind

  def kind_description
    return unless kind

    kind.description
  end

  def as_json(_options = {})
    super(
      only: %i[name email birthdate],
      methods: :kind_description
    )
  end
end
