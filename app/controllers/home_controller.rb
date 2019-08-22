class HomeController < ApplicationController
  def index
    @transactions = Transaction.all
    @users = User.all
    @admin = Admin.all
    @organizations = Organization.all
  end
end
