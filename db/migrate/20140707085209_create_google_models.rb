class CreateGoogleModels < ActiveRecord::Migration
  def change
    create_table :google_models do |t|
      t.string :member_id
      t.string :urls
      t.string :create_date

      t.timestamps
    end
  end
end
