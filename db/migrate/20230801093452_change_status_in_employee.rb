class ChangeStatusInEmployee < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees , :Location , :location
    rename_column :employees , :Reporting_manager , :reporting_manager
    rename_column :employees , :Deparment , :department
    add_column :employees , :status, :boolean
  end
end