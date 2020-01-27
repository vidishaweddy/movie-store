require 'rails_helper'

describe 'Shows Cart Admin Page' do
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
  end

  it "shows movie on cart page" do
    expect(page).to have_selector(:link_or_button, 'Return Movie')
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
    find_button('Return Movie').click
  end

  it "does not show movie on cart page" do
    expect(page).not_to have_content "Quantity : 1"
  end
end
