class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_org
  def current_org
    @current_org = current_user.organization
  end

  private

  protected
  
  def after_sign_in_path_for(resource)
    '/dashboard'
  end

end
