class CreateVolumeRatings < ActiveRecord::Migration
  def change
    create_table :volume_ratings do |t|
      t.references :volume, null: false
      t.references :user, null: false
      t.decimal :rate, precision: 2, scale: 1, default: 0, null: false
      t.timestamps
    end
    add_index :volume_ratings, :volume_id
    add_index :volume_ratings, :user_id
  end
end
