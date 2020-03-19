class AddUuidToVehicles < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    add_column :vehicles, :uuid, :uuid
  end
end
