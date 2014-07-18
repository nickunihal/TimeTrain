class GoogleModel < ActiveRecord::Base
  belongs_to :member

  #Stores url of all posts to database
  def self.store_urls(user)
	GooglePlus.access_token = user.gplus_token
   	person = GooglePlus::Person.get(user.gplus_id,:access_token => user.gplus_token) 
	gplus_activity = person.list_activities

	#checks for previous entries
	user.google_models.delete_all unless user.google_models.last.blank? 
	gplus_activity.each do |item|
	  @gplus_user = GoogleModel.new  			
	  @gplus_user.member = user
	  @gplus_user.urls = item.url.to_s
	  @gplus_user.create_date = item.published
	  @gplus_user.save
 	end
  end
end
