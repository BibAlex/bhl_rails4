class DropVolumeRatingTable < ActiveRecord::Migration
  def change
    drop_table :volume_ratings if ActiveRecord::Base.connection.table_exists? 'volume_ratings'
  end
end
