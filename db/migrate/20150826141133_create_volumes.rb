class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.references :book, null: false
      t.integer :job_id, null: false
      t.integer :volume_number
      t.decimal :rate, precision: 2, scale: 1, default: 0
      t.string :status_code, references: :volumetatuses
      t.timestamps
    end
    add_index :volumes, :book_id
    add_index :volumes, :job_id
  end
end
