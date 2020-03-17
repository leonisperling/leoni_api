class RemoveLocationFromVehicles < ActiveRecord::Migration[5.2]
  def change
    remove_column :vehicles, :location_id
  end
end
