class CreateBookLanguages < ActiveRecord::Migration
  def change
    create_table :book_languages do |t|
      t.references :book, null: false
      t.references :language, null: false
      t.timestamps
    end
  end
end
