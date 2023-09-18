class RemoveIsActiveToDepartments < ActiveRecord::Migration[7.0]
  def change
    remove_column :departments, :is_active, :boolean
  end
end
