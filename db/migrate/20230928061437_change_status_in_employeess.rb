class ChangeStatusInEmployeess < ActiveRecord::Migration[7.0]
  def change
    change_column_default :employees, :status, true
  end
end
