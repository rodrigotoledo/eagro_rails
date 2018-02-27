class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # protect_from_forgery with: :exception, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def layout_by_resource
    if !user_signed_in?
      "devise"
    else
      "application"
    end
  end
end
