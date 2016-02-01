class CreateBatchStatuses < ActiveRecord::Migration
  def change
    create_table :batch_statuses do |t|
      t.string :status_code
      t.timestamps null: false
    end
  end
end
