class DropVolumeRatingTable < ActiveRecord::Migration
  def change
    drop_table :volume_ratings
  end
end
