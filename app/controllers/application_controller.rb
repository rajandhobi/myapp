class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web p
  # helper_method :current_user
   include Pundit::Authorization
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def default_url_options
    { locale: I18n.locale }
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end


  private 
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  # private 
  # def after_sign_in_path_for(resource)
  #   cities_path
  # end

  # def after_sign_up_path_for(resource)
  #   new_user_session_path
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   new_user_session_path
  # end
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end


