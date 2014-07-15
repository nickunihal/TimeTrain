class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :password, :email ,:presence=>true,:on=>:create

  has_many :twitter_models , dependent: :destroy
  has_many :google_models , dependent: :destroy

  def self.update_records (user)
  	TwitterModel.store_urls(user) if user.twitter_id.present? 
    GoogleModel.store_urls(user) if user.gplus_id.present?
  end
  
# def refresh_token_if_expired
#   expiry = Time.at(self.gplus_token_expires_at.to_i) 
#   if expiry < Time.now # expired token, so we should quickly return
#      data = {
#       :client_id => GOOGLE_KEY,
#       :client_secret => GOOGLE_SECRET,
#       :refresh_token => REFRESH_TOKEN,
#       :grant_type => "refresh_token"
#     }
#     @response = ActiveSupport::JSON.decode(RestClient.post "https://accounts.google.com/o/oauth2/token", data)
#     if @response["access_token"].present?
#       self.gplus_token = @response["access_token"]
#     end 
#   end
# end

end
