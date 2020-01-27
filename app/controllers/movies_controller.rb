class MoviesController < ApplicationController
  load_resource
  # GET /movies
  # GET /movies.json
  def index
    @movies = @movies.search(params[:search])
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    respond_to do |format|
      if @movie.save
        format.html {
          redirect_to @movie
        }
        format.json {
          render :show, status: :created, location: @movie
        }
      else
        format.html {
          render :new
        }
        format.json {
          render json: @movie.errors, status: :unprocessable_entity
        }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html {
          redirect_to @movie
        }
        format.json {
          render :show, status: :ok, location: @movie
        }
      else
        format.html {
          render :edit
        }
        format.json {
          render json: @movie.errors, status: :unprocessable_entity
        }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html {
        redirect_to movies_url
      }
      format.json {
        head :no_content
      }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :release_year, :price, :description, :imdb_id, :poster, :filetype, :rating, :quantity,
      {genre_ids: [], actor_ids: []}, actors_attributes: [:id, :first_name, :last_name, :dob, :_destroy])
    end
end
