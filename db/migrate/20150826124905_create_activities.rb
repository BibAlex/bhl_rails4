class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :activitable_id
      t.string :value
      t.string :action, null: false
      t.references :user, null: false
      t.string :activitable_type, null: false
      t.string :activitable_title
      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :activitable_id
  end
end
