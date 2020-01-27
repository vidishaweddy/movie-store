##
# Controller for {Actor}
class Admin::ActorsController < AdminController
  load_and_authorize_resource
  respond_to :html

  def index
    @title = 'Actors'
    @actors = @actors.search(params[:search])

    respond_with(@actors) do |format|
      format.html do
        @actors = @actors.page(params[:page])
        render partial: 'table' if request.xhr?
      end
    end
  end

  def show
    @title = @actor
  end

  def new
    @title = 'New Actor'
  end

  def create
    respond_to do |format|
      if @actor.save
        format.html do
          redirect_to admin_actors_path, notice: 'Actor was successfully created.'
        end
      else
        format.html do
          @title = 'New Actor'
          render action: :new
        end
      end
    end
  end

  def edit
    @title = "Edit #{@actor}"
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html do
          redirect_to admin_actors_path, notice: 'Actor was successfully updated.'
        end
      else
        format.html do
          @title = "Edit #{@actor}"
          render action: :edit
        end
      end
    end
  end

  def destroy
    @actor.destroy
    respond_to do |format|
      format.html {
        redirect_to admin_actors_path
      }
      format.json {
        head :no_content
      }
    end
  end

  private
    def actor_params
      params.require(:actor).permit(:first_name, :last_name, :dob)
    end
end
