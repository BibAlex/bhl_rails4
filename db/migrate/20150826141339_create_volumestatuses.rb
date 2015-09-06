class CreateVolumestatuses < ActiveRecord::Migration
  def change
    create_table :volumestatuses do |t|
      t.string :name
      t.string :code, limit: 2, null: false, unique: true
      t.timestamps
    end
  end
end
