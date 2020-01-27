require 'rails_helper'

describe MoviesController do

  before :each do
    admin = FactoryGirl.create(:admin)
    sign_in admin
  end

  describe 'GET #index' do
    it "collects movie into movies" do
      movie = create(:movie)
      get :index
      expect(assigns(:movies)).to match_array [movie]
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assign the requested movie into movies" do
      movie = create(:movie)
      get :show, params: { id: movie }
      expect(assigns(:movie)).to eq(movie)
    end

    it "renders the :index template" do
      get :show, params: { id: create(:movie) }
      expect(response).to render_template :show
    end
  end

  describe 'POST #new' do
    it "creates new movie" do
      expect{
        post :create, params: { movie: FactoryGirl.attributes_for(:movie2) }
      }.to change{Movie.count}.by(1)
    end

    it "redirect to movie #show" do
      post :create, params: { movie: FactoryGirl.attributes_for(:movie2) }
      expect(response).to redirect_to :action => :show, :id => assigns(:movie).id
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'PATCH #update' do
    it "update the movie" do
      @movie = create(:movie)
      patch :update, params: { id: @movie, movie: FactoryGirl.attributes_for(:movie, title: 'last') }
      @movie.reload
      expect(@movie.title).to eq('last')
    end

    it "redirect to movie #show" do
      @movie = create(:movie)
      patch :update, params: { id: @movie, movie: FactoryGirl.attributes_for(:movie, title: 'last') }
      expect(response).to redirect_to :action => :show, :id => assigns(:movie).id
    end

    it "renders the :new template" do
      movie = create(:movie)
      get :edit, params: { id: movie }
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the movie" do
      expect{
      delete :destroy, params: { id: create(:movie) }
    }.to change{Movie.count}.by(0)
    end

    it "redirect to movie #index" do
      delete :destroy, params: { id: create(:movie) }
      expect(response).to redirect_to :action => :index
    end
  end
end
