class AddIsActiveToVendors < ActiveRecord::Migration[7.0]
  def change
    add_column :vendors, :is_active, :boolean, default: true, null: false
  end
end
