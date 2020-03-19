class AddColumnActiveToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :active, :boolean, default: :false
  end
end
