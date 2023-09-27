class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :departments, id: :uuid do |t|
      t.string :department_name
      t.string :contact_person_name
      t.string :contact_person_email
      t.string :contact_person_phone
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
