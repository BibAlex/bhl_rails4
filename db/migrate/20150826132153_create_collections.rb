class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :description
      t.boolean :is_public, default: false
      t.string :photo_name
      t.decimal :rate, precision: 2, scale: 1, default: 0
      t.timestamps
    end
    add_index :collections, :title
    add_index :collections, :rate
  end
end
