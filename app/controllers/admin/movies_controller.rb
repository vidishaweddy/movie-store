##
# Controller for {MoviesAdmin}
class Admin::MoviesController < AdminController
  load_and_authorize_resource
  respond_to :html

  def index
    @title = 'Movies'
    @movies = @movies.search(params[:search])

    respond_with(@movies) do |format|
      format.html do
        @movies = @movies.page(params[:page])
        render partial: 'table' if request.xhr?
      end
    end
  end

  def show
    @title = @movie
  end

  def new
    @title = 'New Movie'
  end

  def create
    respond_to do |format|
      if @movie.save
        format.html do
          redirect_to admin_movie_path(@movie), notice: 'Movie was successfully created.'
        end
      else
        format.html do
          @title = 'New Movie'
          render action: :new
        end
      end
    end
  end

  def edit
    @title = "Edit #{@movie}"
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html do
          redirect_to admin_movie_path(@movie), notice: 'Movie was successfully updated.'
        end
      else
        format.html do
          @title = "Edit #{@movie}"
          render action: :edit
        end
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_movies_path
      }
      format.json {
        head :no_content
      }
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :release_year, :price, :description, :imdb_id, :poster, :filetype, :rating, :quantity,
      {genre_ids: [], actor_ids: []}, actors_attributes: [:id, :first_name, :last_name, :dob, :_destroy])
    end
end
