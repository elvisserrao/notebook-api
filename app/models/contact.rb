# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :kind

  def as_json(options={})
    super(only: [:name, :email])
  end
end
