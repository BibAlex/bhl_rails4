class CreateBhlStatistics < ActiveRecord::Migration
  def change
    create_table :bhl_statistics do |t|
      t.integer :books_count
      t.integer :authors_count
      t.integer :species_count
      t.timestamps
    end
  end
end
