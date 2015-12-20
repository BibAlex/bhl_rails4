class ChangePageColumnInAnnotations < ActiveRecord::Migration
  def change
     change_column :annotations, :page, :integer, :null => true
  end
end
