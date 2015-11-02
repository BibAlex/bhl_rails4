class AddContributorToBooks < ActiveRecord::Migration
  def change
    add_column :books, :contributor, :string
  end
end
