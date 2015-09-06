class CreateHierarchyEntries < ActiveRecord::Migration
  def change
    create_table :hierarchy_entries do |t|
      t.references :hierarchy
      t.timestamps
    end
  end
end
