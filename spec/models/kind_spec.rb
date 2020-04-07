require 'rails_helper'

RSpec.describe Kind, type: :model do

  it "Don't create a kind when description isn't present" do
    expect(Kind.create).to_not be_valid
  end

  it "Create a kind when description is present" do
    expect(Kind.create(description: "Amigo")).to be_valid
  end

end
