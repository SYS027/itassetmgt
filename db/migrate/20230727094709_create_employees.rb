class CreateEmployees < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :employees, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :employee_id
      t.string :phone
      t.string :location
      t.string :reporting_manager
      t.string :department

      t.timestamps
    end
  end

  def down
    drop_table :employees

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
