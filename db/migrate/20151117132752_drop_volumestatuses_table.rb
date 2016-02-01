class DropVolumestatusesTable < ActiveRecord::Migration
  def change
    drop_table :volumestatuses if ActiveRecord::Base.connection.table_exists? 'volumestatuses'
  end
end
