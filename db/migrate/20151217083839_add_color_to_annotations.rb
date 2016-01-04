class AddColorToAnnotations < ActiveRecord::Migration
  def change
    add_column :annotations, :color, :string
  end
end
