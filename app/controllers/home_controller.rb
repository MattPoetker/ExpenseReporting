class HomeController < ApplicationController
  before_action :set_current_org
  helper_method :user_is_admin?
  def index
    if user_is_admin? && current_user
      @transactions = current_user.organization.transactions
    elsif current_user
      @transactions = current_user.transactions
    end
    @users = current_user.organization.users if current_user
  end

  private
  def user_is_admin?
    current_user.admin unless !current_user
  end
  def set_current_org
    if current_user
      @current_org = current_user.organization
    end
  end
end
