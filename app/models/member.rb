class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :password, :email ,:presence=>true,:on=>:create

  has_many :twitter_models , dependent: :destroy
  has_many :google_models , dependent: :destroy

  def self.update_records (user)
  	TwitterModel.store_urls(user) if user.twitter_id.present? 
    if user.gplus_id.present?
      data = {
              client_id: '476602585408-3fiklaclekbinfmbd2lsdjcur1u21ril.apps.googleusercontent.com',
              client_secret: 'RX-7Mq_SXT1DJSJsYJtLj6a4',
              refresh_token: user.gplus_refresh_token,
              grant_type: "refresh_token"
             }
      @response = ActiveSupport::JSON.decode(RestClient.post "https://accounts.google.com/o/oauth2/token", data)
      if @response["access_token"].present?
        user.gplus_token = @response["access_token"]
        user.gplus_token_expires_at = @response["expires_in"]
        user.save
      end
  	  GoogleModel.store_urls(user) 
    end
  end
  
end



