class UpdateVolumes < ActiveRecord::Migration
  def change
    remove_column :volumes, :volume_status_id
    add_reference :volumes, :batch, index: true
  end
end
