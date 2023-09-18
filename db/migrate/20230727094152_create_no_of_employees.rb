class CreateNoOfEmployees < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :no_of_employees, id: :uuid do |t|
      t.integer :emp_id
      t.integer :no_of_employee
      t.boolean :is_active

      t.timestamps
    end
  end

  def down
    drop_table :no_of_employees

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
