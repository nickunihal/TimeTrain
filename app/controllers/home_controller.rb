class HomeController < ApplicationController

  def timeline
    @member = current_member
  end

  def update_timeline
    Member.update_records(current_member)
    redirect_to members_timeline_path
  end
	
  def index
  	if current_member
  		redirect_to members_timeline_path
  	else
  		redirect_to member_session_path
  	end
  end

  def connect_twitter
    
    auth = request.env["omniauth.auth"]
    current_member.twitter_token = auth["credentials"]["token"]
    current_member.twitter_secret = auth["credentials"]["secret"]
    current_member.twitter_id = auth["uid"]
    if current_member.img_url.blank?
      current_member.username = auth.info.name
      current_member.img_url = auth.info.image
	  end
    current_member.save
	  TwitterModel.store_urls(current_member)
	  redirect_to members_social_sign_up_path
  end

  def connect_gplus
	  auth = request.env["omniauth.auth"]
	  current_member.gplus_id = auth["uid"]
    current_member.gplus_token = auth.credentials.token
    current_member.username = auth.info.name
    current_member.img_url = auth.info.image
    current_member.gplus_refresh_token = auth.credentials.refresh_token
    current_member.gplus_token_expires_at = auth.credentials.expires_at
	  current_member.save
	  GoogleModel.store_urls(current_member)
	  redirect_to members_social_sign_up_path	
  end
end