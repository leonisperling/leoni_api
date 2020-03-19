class AddAtToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :at, :timestamp
  end
end
