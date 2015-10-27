class RemoveTitleRequiredFromBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.change :title, :string, limit: 2000, null: true
    end
  end
end
