class Users::InvitationsController < Devise::InvitationsController
  def update
    user = accept_resource
    invited_by = User.find(user.invited_by_id)
    user.organization = invited_by.organization
    user.admin = false
    user.save!
    super

  end


  def resend
    user = User.find(params[:user])
    user.invite!

  end
end
