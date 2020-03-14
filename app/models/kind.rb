# frozen_string_literal: true

class Kind < ApplicationRecord
  has_many :contacts

  def as_json(_options = {})
    super(
      only: %i[description],
    )
  end
end
