class HomeController < ApplicationController
  def index
    @transactions = Transaction.all
    @users = User.all
    @admins = Admin.all
  end
end
