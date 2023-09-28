class CreateStates < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :states, id: :uuid do |t|
      t.string :state_name
      t.uuid :country_id, null: false  # Change the data type to uuid
      t.timestamps
    end

    # Add a foreign key constraint with matching data types
    add_foreign_key :states, :countries, column: :country_id, type: :uuid
  end
end
