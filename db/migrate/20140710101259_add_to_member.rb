class AddToMember < ActiveRecord::Migration
  def change
  	  	add_column :members, :gplus_refresh_token, :string
  	  	add_column :members, :gplus_token_expires_at, :string


  end
end
