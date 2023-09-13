class AddSerialNumberToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :serial_number, :string
  end
end
