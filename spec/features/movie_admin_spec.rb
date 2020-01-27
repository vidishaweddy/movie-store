require 'rails_helper'

describe 'Shows Admin Index Page' do
  admin = FactoryGirl.build(:admin)

  it "shows new movie button" do
    login_as(admin)
    visit admin_root_path
    expect(page).to have_content "Movie Store"
  end
end

describe 'Shows Cart Admin Page' do
  admin = FactoryGirl.build(:admin)

  it "shows movie on cart page" do
    login_as(admin)
    movie = FactoryGirl.create(:movie)
    visit admin_root_path
    login_as(admin)
    visit admin_movie_path(movie.id)
    expect(page).to have_selector(:link_or_button, 'Edit')
  end
end

describe 'Edits Movie Page' do
  admin = FactoryGirl.build(:admin)

  it "edited movie year" do
    login_as(admin)
    movie = FactoryGirl.create(:movie)
    visit admin_root_path
    login_as(admin)
    visit admin_movie_path(movie.id)
    login_as(admin)
    visit edit_admin_movie_path(admin.id)
    login_as(admin)
    fill_in 'movie_release_year', with: '1990'
    click_link('Submit')
    login_as(admin)
    visit admin_movies_path
    expect(page).to have_content "1990"
  end
end

describe 'Deletes Movie' do
  admin = FactoryGirl.build(:admin)

  it "deleted movie" do
    login_as(admin)
    movie = FactoryGirl.create(:movie)
    visit admin_root_path
    login_as(admin)
    visit admin_movie_path(movie.id)
    login_as(admin)
    find_button('delete_button').click
    expect(page).not_to have_content "2000"
  end
end

describe 'Adds Movie Page' do
  admin = FactoryGirl.build(:admin)

  it "shows new movie" do
    login_as(admin)
    visit new_movie_path
    login_as(admin)
    movie = FactoryGirl.create(:movie)
    fill_in 'movie_title', with: movie.title
    fill_in 'movie_release_year', with: movie.release_year
    fill_in 'movie_price', with: movie.price_cents
    fill_in 'movie_imdb_id', with: movie.imdb_id
    fill_in 'movie_rating', with: movie.rating
    fill_in 'movie_quantity', with: movie.quantity
    fill_in 'movie_filetype', with: movie.filetype
    fill_in 'movie_description', with: movie.description
    click_button 'Submit'
    visit movies_path
    expect(page).to have_content "2000"
  end
end
