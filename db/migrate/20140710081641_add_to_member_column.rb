class AddToMemberColumn < ActiveRecord::Migration
  def change
  	add_column :members, :img_url, :string

  end
end
