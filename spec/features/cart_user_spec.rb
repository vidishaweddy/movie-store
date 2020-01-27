require 'rails_helper'

describe 'Adds Movie Page' do
  user = FactoryGirl.build(:user)

  before :each do
    login_as(user)
    movie = FactoryGirl.create(:movie)
    visit movies_path
    find('.movie-link').click
    login_as(user)
    find('.new-cart').click
    login_as(user)
    click_button "Submit"
  end

  it "movie added successfully" do
    expect(page).to have_content "Out of Stock"
  end
end

describe 'Adds Movie Page' do
  user = FactoryGirl.build(:user)

  before :each do
    login_as(user)
    movie = FactoryGirl.create(:movie)
    visit movies_path
    find('.movie-link').click
    login_as(user)
    find('.new-cart').click
    login_as(user)
    fill_in 'cart_quantity', with: '5'
    click_button "Submit"
  end

  it "shows movie rental failure message" do
    expect(page).to have_content "the quantity exceeds the maximum number of copy available"
  end
end

describe 'Returns Movie on Cart Admin Page' do
  admin = FactoryGirl.build(:admin)

  before :each do
    login_as(admin)
    movie = FactoryGirl.create(:movie)
    visit movies_path
    find('.movie-link').click
    login_as(admin)
    find('.new-cart').click
    login_as(admin)
    click_button "Submit"
    login_as(admin)
    find('.rent-list').click
    login_as(admin)
    find_button('Show PDF').click
    convert_pdf_to_page
  end

  it "shows receipt pdf" do
    expect(page).to have_content "Quantity : 1"
  end
end

describe 'Shows Cart Page' do
  user = FactoryGirl.build(:user)

  before :each do
    login_as(user)
    movie = FactoryGirl.create(:movie)
    visit movies_path
    find('.movie-link').click
    login_as(user)
    find('.new-cart').click
    login_as(user)
    click_button "Submit"
    find('.rent-list').click
    login_as(user)
  end

  it "shows movie on cart page" do
    expect(page).to have_content "Quantity : 1"
  end
end
