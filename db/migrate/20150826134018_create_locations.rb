class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :formatted_address, null: false
      t.float :latitude
      t.float :longitude
      t.references :country
      t.timestamps
    end
  end
end
