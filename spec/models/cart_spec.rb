require 'rails_helper'

describe Cart do

  it "has a valid data" do
    carts = FactoryGirl.build(:cart)
    movie = FactoryGirl.create(:movie)
    user = FactoryGirl.create(:user)
    cart = Cart.new(
      quantity: carts.quantity,
      return_at: carts.return_at,
      rent_at: carts.rent_at,
      user: user,
      movie: movie)
    expect(cart).to be_valid
  end

  it "is invalid without a quantity" do
    cart = Cart.new(
      quantity: nil
    )
    cart.valid?
    expect(cart).to be_invalid
  end

  it "is invalid without a return_at" do
    cart = Cart.new(
      return_at: nil
    )
    cart.valid?
    expect(cart).to be_invalid
  end

  it "is invalid without a rent_at" do
    cart = Cart.new(
      rent_at: nil
    )
    cart.valid?
    expect(cart).to be_invalid
  end

  it "is invalid without a movie_id" do
    cart = Cart.new(
      movie_id: nil
    )
    cart.valid?
    expect(cart).to be_invalid
  end

  it "is invalid without a user_id" do
    cart = Cart.new(
      user_id: nil
    )
    cart.valid?
    expect(cart).to be_invalid
  end

  it 'sends an receipt email' do
    carts = FactoryGirl.build(:cart)
    movie = FactoryGirl.create(:movie)
    user = FactoryGirl.create(:user)
    cart = Cart.new(
      quantity: carts.quantity,
      return_at: carts.return_at,
      rent_at: carts.rent_at,
      user: user,
      movie: movie)
    expect { cart.send_email }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
