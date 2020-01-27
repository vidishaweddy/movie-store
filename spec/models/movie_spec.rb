require 'rails_helper'

describe Movie do
  it "has a valid factory" do
    expect(FactoryGirl.build(:movie)).to be_valid
  end

  it "is valid with a title, release_year, price_cents, imdb_id, rating, quantity, filetype and description" do
    movie = Movie.new(
      title: 'A',
      release_year: '2000',
      price: '1.0',
      imdb_id: 'a',
      rating: '8',
      quantity: '3',
      filetype: 'a',
      description: 'a')
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie = Movie.new(
      title: nil
    )
    movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a release_year" do
    movie = Movie.new(
      release_year: nil
    )
    movie.valid?
    expect(movie.errors[:release_year]).to include("can't be blank")
  end

  it "is invalid without a price" do
    movie = Movie.new(
      price_cents: nil
    )
    movie.valid?
    expect(movie.errors[:price_cents]).to include("is not a number")
  end

  it "is invalid without an imdb_id" do
    movie = Movie.new(
      imdb_id: nil
    )
    movie.valid?
    expect(movie.errors[:imdb_id]).to include("can't be blank")
  end

  it "is invalid without a rating" do
    movie = Movie.new(
      rating: nil
    )
    movie.valid?
    expect(movie.errors[:rating]).to include("can't be blank")
  end

  it "is invalid without a quantity" do
    movie = Movie.new(
      quantity: nil
    )
    movie.valid?
    expect(movie.errors[:quantity]).to include("can't be blank")
  end

  it "is invalid without a filetype" do
    movie = Movie.new(
      filetype: nil
    )
    movie.valid?
    expect(movie.errors[:filetype]).to include("can't be blank")
  end

  it "is invalid without a description" do
    movie = Movie.new(
      description: nil
    )
    movie.valid?
    expect(movie.errors[:description]).to include("can't be blank")
  end

  it "is invalid with the wrong file size" do
    movie = Movie.new(
      poster: File.new(Rails.root + 'spec/fixtures/images/black.jpg')
    )
    movie.valid?
    expect(movie.errors[:poster]).to include("should be less than 500KB")
  end

  it "is invalid with the wrong file type" do
    movie = Movie.new(
      poster: File.new(Rails.root + 'spec/fixtures/images/test.rtf')
    )
    movie.valid?
    expect(movie).to be_invalid
  end

  it "rejects blank value" do
    actor = FactoryGirl.build(:actors)
    should_not accept_nested_attributes_for(:actor)
  end

end
