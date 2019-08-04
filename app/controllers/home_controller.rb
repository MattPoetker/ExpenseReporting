class HomeController < ApplicationController
  def index
    @transactions = Transaction.all
    @users = User.all
    @admin = Admin.all
  end
end
