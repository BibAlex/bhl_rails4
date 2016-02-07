class RemoveStatusFromBatches < ActiveRecord::Migration
  def change
    remove_column :batches, :status
  end
end
