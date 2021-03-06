class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :password, :email ,:presence=>true,:on=>:create

  has_many :twitter_models , dependent: :destroy
  has_many :google_models , dependent: :destroy

  #update authorised models (google plus and twitter)
  def self.update_records (user)
  	TwitterModel.store_urls(user) if user.twitter_id.present? 
    if user.gplus_id.present?
      user.token_expired?
      GoogleModel.store_urls(user) 
    end
  end

  #if google access token is expired, fetches a new one
  def token_expired?
    expiry = Time.at(self.gplus_token_expires_at.to_i) 
    if expiry < Time.now 
      data = {
              client_id: '476602585408-3fiklaclekbinfmbd2lsdjcur1u21ril.apps.googleusercontent.com',
              client_secret: 'RX-7Mq_SXT1DJSJsYJtLj6a4',
              refresh_token: self.gplus_refresh_token,
              grant_type: "refresh_token"
             }
      @response = ActiveSupport::JSON.decode(RestClient.post "https://accounts.google.com/o/oauth2/token", data)
      if @response["access_token"].present?
        self.gplus_token = @response["access_token"]
        self.gplus_token_expires_at = @response["expires_in"]
        self.save
      end
    end
  end
  
end



