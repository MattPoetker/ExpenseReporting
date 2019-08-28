class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_org
  before_action :configure_permitted_parameters, if: :devise_controller?
  def current_org
    @current_org = current_user.organization
  end

  private

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :organization_attributes => :name])
  end
  def after_sign_in_path_for(resource)
    '/dashboard'
  end

end
