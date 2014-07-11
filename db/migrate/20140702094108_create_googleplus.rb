class CreateGoogleplus < ActiveRecord::Migration
  def change
    create_table :googleplus do |t|
      t.string :urls
      t.timestamp :create_date

      t.timestamps
    end
  end
end
