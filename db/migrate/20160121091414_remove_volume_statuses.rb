class RemoveVolumeStatuses < ActiveRecord::Migration
  def change
    drop_table :volume_statuses if ActiveRecord::Base.connection.table_exists? 'volume_statuses'
  end
end
