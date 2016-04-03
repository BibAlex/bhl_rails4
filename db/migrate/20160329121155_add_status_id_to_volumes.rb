class AddStatusIdToVolumes < ActiveRecord::Migration
  def change
    add_column :volumes, :status_id, :integer
  end
end
