class Admin::GenresController < AdminController
  load_and_authorize_resource
  respond_to :html

  def index
    @title = 'Genres'
    @genres = @genres.search(params[:search])

    respond_with(@genres) do |format|
      format.html do
        @genres = @genres.page(params[:page])
        render partial: 'table' if request.xhr?
      end
    end
  end

  def show
    @title = @genre
  end

  def new
    @title = 'New Genre'
  end

  def create
    respond_to do |format|
      if @genre.save
        format.html do
          redirect_to admin_genres_path, notice: 'Genre was successfully created.'
        end
      else
        format.html do
          @title = 'New Genre'
          render action: :new
        end
      end
    end
  end

  def edit
    @title = "Edit #{@genre}"
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html do
          redirect_to admin_genres_path, notice: 'Genre was successfully updated.'
        end
      else
        format.html do
          @title = "Edit #{@genre}"
          render action: :edit
        end
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_genres_path
      }
      format.json {
        head :no_content
      }
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
