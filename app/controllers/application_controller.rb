class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :current_password, :age, :dob, :address] )
    end  
end
