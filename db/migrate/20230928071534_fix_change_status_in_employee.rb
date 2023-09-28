class FixChangeStatusInEmployee < ActiveRecord::Migration[7.0]
  def change
    # Modify the existing migration code here to correct any issues
    rename_column :employees, :Location, :location
    rename_column :employees, :Reporting_manager, :reporting_manager
    rename_column :employees, :Deparment, :department
    add_column :employees, :status, :boolean
  end
end
