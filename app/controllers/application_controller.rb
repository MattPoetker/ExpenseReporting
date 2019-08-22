class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_org
    @current_org = Organization.find(current_user.organization_id)
  end
  helper_method :current_org

  private

  protected

  def after_sign_in_path_for(resource)
    '/dashboard'
  end

end
