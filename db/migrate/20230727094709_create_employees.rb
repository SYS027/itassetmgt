class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :employee_id
      t.string :phone
      t.string :Location
      t.string :Reporting_manager
      t.string :Deparment
      t.timestamps
    end
  end
end
