class ChangeStatusInEmployeess < ActiveRecord::Migration[7.0]
  def up
    change_column_default :employees, :status, true
  end

  def down
    change_column_default :employees, :status, nil
  end
end
