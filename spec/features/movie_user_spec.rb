require 'rails_helper'

describe 'Shows Index Page' do
  user = FactoryGirl.build(:user)

  it "shows new movie button" do
    login_as(user)
    visit movies_path
    expect(page).to have_content "Featured Movie"
  end
end

describe 'Shows Movie Page' do
  user = FactoryGirl.build(:user)

  it "open movie info page" do
    login_as(user)
    movie = FactoryGirl.create(:movie)
    visit movies_path
    find('.movie-link').click
    expect(page).to have_content "Starring :"
  end
end

describe 'Shows Selected Movie' do
  user = FactoryGirl.build(:user)
  movie1 = FactoryGirl.create(:movie)
  movie2 = FactoryGirl.create(:movie)

  before :each do
    login_as(user)
    visit movies_path
    fill_in 'search-form', with: movie1.title
  end

  it "shows movie based on search" do
    expect(page).not_to have_content movie2.title
  end
end
