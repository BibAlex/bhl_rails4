class CreateBookViews < ActiveRecord::Migration
  def change
    create_table :book_views do |t|
      t.integer :source_book_id, null: false
      t.integer :dest_book_id, null: false
      t.string :source_book_title
      t.string :dest_book_title
      t.timestamps null: false
    end
  end
end
