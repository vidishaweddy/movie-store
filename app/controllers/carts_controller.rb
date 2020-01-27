class CartsController < ApplicationController
  load_and_authorize_resource except: :show
  def show
    if(current_user.admin == true)
      @carts = Cart.all
    else
      @carts = current_user.carts
    end
  end

  def new
    @cart = Cart.new
    @movie = Movie.find(params[:format])
  end

  def create
    @cart.user_id = current_user.id
    @movie = Movie.find(@cart.movie_id)
    respond_to do |format|
      if @cart.quantity > @movie.quantity
        format.html {
          flash.now[:alert] = 'the quantity exceeds the maximum number of copy available'
          render :new
        }
      else
        if @cart.save
          format.html {
            redirect_to @movie
          }
          format.json {
            render :index, status: :created, location: @movie
          }
        else
          format.html {
            render :new
          }
          format.json {
            render json: @cart.errors, status: :unprocessable_entity
          }
        end
      end
    end
  end

  def destroy
    @movie = @cart.movie
    @movie.quantity = @movie.quantity + @cart.quantity
    @cart.quantity = 0
    @cart.save
    @movie.save
    respond_to do |format|
      format.html {
        redirect_to(admin_root_path)
      }
      format.json {
        render :index, status: :saved
      }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:movie_id, :user_id, :quantity, :rent_at, :return_at)
    end

end
