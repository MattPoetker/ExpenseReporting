# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # skip_before_action :ensure_subdomain
  # after_action :set_organization_subdomain
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    resource.organization.email = resource.email
    resource.save
  end

  # GET /resource/edit
  def edit
   super
  end

  # PUT /resource
  def update
    #super
    if resource.update(account_update_params)
      flash[:success] = "Successfully updated!"
      puts "Flash message: #{flash[:success]}"
    else
      flash[:danger] = "There was a problem!"
      puts "Flash message: #{flash[:success]}"
    end
    redirect_to edit_user_registration_path(resource)
    #super

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, organizations_attributes: [:id, :name])}
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email)}
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    '/dashboard'
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
