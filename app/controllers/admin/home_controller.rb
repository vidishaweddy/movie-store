class Admin::HomeController < AdminController
  def index
    @carts = Cart.all
  end
end
