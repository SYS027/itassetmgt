class CreateStates < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :states do |t|
      t.string :state_name
      t.integer :country_id, null: false  # Change the data type to integer
      t.timestamps
    end

    # Add a foreign key constraint with matching data types
    add_foreign_key :states, :countries, column: :country_id
  end
end
