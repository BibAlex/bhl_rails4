class CreateUserVolumeHistories < ActiveRecord::Migration
  def change
    create_table :user_volume_histories do |t|
      t.references :user, null: false
      t.references :volume, null: false
      t.timestamps
    end
  end
end
