class HomeController < ApplicationController
  before_action :set_current_org
  def index
    @transactions = Transaction.all
    @users = User.all
    @admin = Admin.all
    @organizations = Organization.all
  end

  private
  def set_current_org
    if current_user
      @current_org = current_user.organization
    end
  end
end
