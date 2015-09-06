class CreateCollectionVolumes < ActiveRecord::Migration
  def change
    create_table :collection_volumes do |t|
      t.references :volume, null: false
      t.references :collection, null: false
      t.integer :position
      t.timestamps
    end
    add_index :collection_volumes, :volume_id
    add_index :collection_volumes, :collection_id
  end
end
