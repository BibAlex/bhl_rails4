class UpdateVolumeStatusField < ActiveRecord::Migration
  def change
    change_column :volumes, :status_code, :integer
    rename_column :volumes, :status_code, :volume_status_id
  end
end
