class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :rateable_id
      t.string  :rateable_type
      t.references :user, null: false
      t.decimal :rate, precision: 2, scale: 1, default: 0, null: false
      t.timestamps
    end
    add_index :rates, :rateable_id
    add_index :rates, :user_id
  end
end
