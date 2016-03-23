class AddNumberOfTrialsToVolume < ActiveRecord::Migration
  def change
    add_column :volumes, :number_of_trials, :integer, default: 0
  end
end
