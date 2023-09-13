class AddStatusToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :status, :boolean, default: true
  end
end
