class DropBookstatusesTable < ActiveRecord::Migration
  def change
    drop_table :bookstatuses
  end
end
