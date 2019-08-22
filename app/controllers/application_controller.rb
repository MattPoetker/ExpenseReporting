class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_subdomain

  def current_org
    @current_org ||= Organization.find_by(subdomain: request.subdomain)
  end
  helper_method :current_org

  private

  def ensure_subdomain
    if !current_org.present?
      redirect_to root_url(subdomain: :www)
    end
  end
  protected

  def after_sign_in_path_for(resource)
    '/dashboard'
  end

end
