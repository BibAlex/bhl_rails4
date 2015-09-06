class CreateBookLocations < ActiveRecord::Migration
  def change
    create_table :book_locations do |t|
      t.references :book, null: false
      t.references :location, null: false
      t.timestamps
    end
  end
end
