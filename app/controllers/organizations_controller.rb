class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def edit

  end
  def create
    @organization = Organization.new(org_params)
    if @organization.save
      current_user.organization = @organization
      current_user.save
      redirect_to '/dashboard'

    else
      render 'users/setup'
    end
  end

  private
  def org_params
    params.require(:organization).permit(:name)
  end
end
