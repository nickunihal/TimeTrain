class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    members_social_sign_up_path
  end
end