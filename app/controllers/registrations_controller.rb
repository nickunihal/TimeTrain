class RegistrationsController < Devise::RegistrationsController
  protected

  #redirect to Social signup page after User signup
  def after_sign_up_path_for(resource)
    members_social_sign_up_path
  end
end