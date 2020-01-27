require 'rails_helper'

describe Genre do
  it "has a valid factory" do
    expect(FactoryGirl.build(:genre)).to be_valid
  end

  it "is valid with a name" do
    genre = Genre.new(
      name: 'A')
    expect(genre).to be_valid
  end

  it "is invalid without a name" do
    genre = Genre.new(
      name: nil
    )
    genre.valid?
    expect(genre.errors[:name]).to include("can't be blank")
  end
end
