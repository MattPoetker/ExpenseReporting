class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def setup
    @organization = Organization.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])

  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { render :edit, success: 'User was successfully updated.' }
        format.json { render :home, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:admin, :name, :email, :password)
  end

end
