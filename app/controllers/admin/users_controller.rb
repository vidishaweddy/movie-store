##
# Controller for {User}
class Admin::UsersController < AdminController
  load_and_authorize_resource
  respond_to :html

  def index
    @title = 'Users'
    @users = @users.search(params[:search])

    respond_with(@users) do |format|
      format.html do
        @users = @users.page(params[:page])
        render partial: 'table' if request.xhr?
      end
    end
  end

  def show
    @title = @user
  end

  def new
    @title = 'New User'
  end

  def create
    respond_to do |format|
      if @user.save
        format.html do
          redirect_to admin_user_path(@user), notice: 'User was successfully created.'
        end
      else
        format.html do
          @title = 'New User'
          render action: :new
        end
      end
    end
  end

  def edit
    @title = "Edit #{@user}"
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
        end
      else
        format.html do
          @title = "Edit #{@user}"
          render action: :edit
        end
      end
    end
  end

  def destroy
    # Place your destroy logic here
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :dob, :address, :age, :admin)
    end
end
