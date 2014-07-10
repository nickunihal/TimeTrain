class CreateTwitterModels < ActiveRecord::Migration
  def change
    create_table :twitter_models do |t|
      t.string :urls
      t.timestamp :create_date
      t.integer :member_id

      t.timestamps
    end
  end
end
