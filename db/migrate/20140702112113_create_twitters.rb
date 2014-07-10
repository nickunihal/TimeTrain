class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :urls
      t.timestamp :create_date
      t.integer :member_id

      t.timestamps
    end
  end
end
