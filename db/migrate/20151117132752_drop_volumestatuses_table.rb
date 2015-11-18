class DropVolumestatusesTable < ActiveRecord::Migration
  def change
    drop_table :volumestatuses
  end
end
