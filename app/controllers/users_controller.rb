class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def setup
    @organization = Organization.new
    @user = current_user
  end

end
