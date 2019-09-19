class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_org
  helper_method :user_is_admin?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?
  def current_org
    @current_org = current_user.organization
  end

  private
  def user_is_admin?
    current_user.admin unless !current_user
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :organization_attributes => :name])
  end
  def after_sign_in_path_for(resource)
    '/dashboard'
  end
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email)}
  end

end
