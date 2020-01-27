class AdminController < ApplicationController
  before_filter do
    redirect_to root_path unless current_user && current_user.admin?
  end
end
