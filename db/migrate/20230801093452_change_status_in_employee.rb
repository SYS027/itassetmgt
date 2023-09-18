class ChangeStatusInEmployee < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto') # Add this line if you want to use UUIDs

    rename_column :employees, :Location, :location
    rename_column :employees, :Reporting_manager, :reporting_manager
    rename_column :employees, :Deparment, :department
    add_column :employees, :status, :boolean
  end
end
