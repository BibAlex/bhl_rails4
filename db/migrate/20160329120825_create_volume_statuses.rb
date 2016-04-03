class CreateVolumeStatuses < ActiveRecord::Migration
  def change
    create_table :volume_statuses do |t|
      t.string :status_code
      t.timestamps null: false
    end
  end
end
