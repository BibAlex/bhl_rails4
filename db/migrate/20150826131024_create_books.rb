class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, limit: 2000, null: false
      t.string :title_alternative, limit: 2000
      t.string :published_at
      t.string :publisher, limit: 1000
      t.text :mods
      t.string :status_code, references: :bookstatuses
      t.timestamps
    end
  end
end
