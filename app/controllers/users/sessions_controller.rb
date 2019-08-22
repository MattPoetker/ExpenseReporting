# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  after_action :custom_welcome, :only => [:create]
  after_action :custom_goodbye, :only => [:destroy]
  skip_before_action :ensure_subdomain

  def custom_welcome
    flash[:notice] = nil
    flash['success'] = "Welcome back "+current_user.email+"."
    puts "Flash message is: " + flash['success']
  end

  def custom_goodbye
    flash[:notice] = nil
    flash['success'] = "Signed out successfully!"
    puts "Flash message is: " + flash['success']
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
