class AddToMemberTwitterToken < ActiveRecord::Migration
  def change
  	add_column :members, :twitter_token, :string
	add_column :members, :twitter_secret, :string
  	add_column :members, :gplus_token, :string
  end
end
