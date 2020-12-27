class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Response
  include ExceptionHandler

  protected

  def configure_permitted_parameters
    registration_params = %i[username email password]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update, keys: registration_params)
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:signup, keys: registration_params)
    end
  end
end
