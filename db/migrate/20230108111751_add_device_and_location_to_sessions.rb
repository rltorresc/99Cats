class AddDeviceAndLocationToSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :device, :string
    add_column :sessions, :location, :string
  end
end
