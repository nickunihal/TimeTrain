class TwitterModel < ActiveRecord::Base
  belongs_to :member

  def self.store_urls(user)
  	client = Twitter::REST::Client.new do |config|
	    config.consumer_key        = 'KFmY7FZfHs4nPCsuerXj61isy'
	    config.consumer_secret     = 'K3z9WkgHN2uAbppe7MaYRyyLJf1lCVHWHPtVpEtyyCSJFpYCHb'
	    config.access_token        = user.twitter_token
	    config.access_token_secret = user.twitter_secret
	  end
    user.twitter_models.delete_all unless user.twitter_models.last.blank? 
	  tweets = client.user_timeline 
  	tweets.each do |item|
    	@twitter_user = TwitterModel.new
   	  @twitter_user.urls =  item.url.to_s
   	  @twitter_user.member = user
      @twitter_user.create_date = item.created_at
   	  @twitter_user.save
	  end
  end	

end