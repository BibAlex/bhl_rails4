class CreateHierarchies < ActiveRecord::Migration
  def change
    create_table :hierarchies do |t|

      t.timestamps
    end
  end
end
