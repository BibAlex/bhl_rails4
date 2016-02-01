class RemoveVolumeStatuses < ActiveRecord::Migration
  def change
    drop_table :volume_statuses
  end
end
