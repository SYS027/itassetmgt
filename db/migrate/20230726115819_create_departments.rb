class CreateDepartments < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :departments, id: :uuid do |t|
      t.string :department_name
      t.string :contact_person_name
      t.string :contact_person_email
      t.string :contact_person_phone
      t.boolean :is_active

      t.timestamps
    end
  end

  def down
    drop_table :departments

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
