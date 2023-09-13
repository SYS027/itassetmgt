class CreateNoOfEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :no_of_employees do |t|
      t.integer :emp_id
      t.integer :no_of_employee
      t.boolean :is_active

      t.timestamps
    end
  end
end
