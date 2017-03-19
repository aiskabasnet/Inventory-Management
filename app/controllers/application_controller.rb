class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :middle_name, :last_name, :username,:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :middle_name, :last_name, :username,:email, :password, :password_confirmation])
  #  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :middle_name, :last_name, :username,:email, :password, :password_confirmation)}
  end


end
