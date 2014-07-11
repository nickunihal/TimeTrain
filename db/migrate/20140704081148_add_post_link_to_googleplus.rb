class AddPostLinkToGoogleplus < ActiveRecord::Migration
  def change
    add_column :googleplus, :post_link, :string
  end
end
