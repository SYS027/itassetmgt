class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :companies do |t|
      t.string :name
      t.string :email
      t.integer :contact_number
      t.string :portal_name
      t.string :industry
      t.integer :number_of_employees
      t.string :tax_information
      t.references :country, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.integer :pin_code
      t.string :address
      t.binary :logo

      t.timestamps
    end
  end
end
