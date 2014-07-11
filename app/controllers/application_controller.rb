class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource) 
   	members_timeline_path
  end

  def failure
    redirect_to members_social_sign_up_path
  end

end
