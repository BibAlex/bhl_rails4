class CreateVolumeNames < ActiveRecord::Migration
  def change
    create_table :volume_names do |t|
      t.references :volume, null: false
      t.references :name, null: false
      t.string :name_found
      t.integer :page_number
      t.timestamps
    end
  end
end
