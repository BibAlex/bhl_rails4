class UpdateFormattedAddressInLocations < ActiveRecord::Migration
  def change
    change_column :locations, :formatted_address, :string, :null => true
  end
end
