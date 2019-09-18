class HomeController < ApplicationController
  before_action :set_current_org
  helper_method :user_is_admin?
  def index
    if user_is_admin?
      @transactions = current_user.organization.transactions
    else
      @transactions = current_user.transactions
    end
    @users = User.all
    @organizations = Organization.all
  end

  private
  def user_is_admin?
    if current_user
      current_user.admin
    end
  end
  def set_current_org
    if current_user
      @current_org = current_user.organization
    end
  end
end
