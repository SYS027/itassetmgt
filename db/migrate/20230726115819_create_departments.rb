class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :department_name
      t.string :contact_person_name
      t.string :contact_person_email
      t.string :contact_person_phone
      t.boolean :is_active

      t.timestamps
    end
  end
end
