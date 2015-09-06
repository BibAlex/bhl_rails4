class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.references :volume, null: false
      t.references :user, null: false
      t.integer :page, null: false
      t.integer :location_x
      t.integer :location_y
      t.integer :height
      t.integer :width
      t.integer :zorder
      t.integer :hltype
      t.string :text
      t.string :anntype, null: false
      t.string :basketpages
      t.timestamps
    end
    add_index :annotations, :volume_id
    add_index :annotations, :user_id
  end
end
