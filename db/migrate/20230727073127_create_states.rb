class CreateStates < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :states, id: :uuid do |t|
      t.string :state_name
      t.references :country, null: false, foreign_key: { to_table: :countries, type: :uuid }

      t.timestamps
    end
  end

  def down
    drop_table :states

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
