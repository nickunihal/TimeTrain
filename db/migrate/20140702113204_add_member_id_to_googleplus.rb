class AddMemberIdToGoogleplus < ActiveRecord::Migration
  def change
  	add_column :googleplus, :member_id, :integer
  end
end
