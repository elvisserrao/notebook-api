# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind

  def kind_description
    kind.description
  end

  def as_json(_options = {})
    super(
      only: %i[name email],
      methods: :kind_description
    )
  end
end
