class CreateCities < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :cities, id: :uuid do |t|
      t.string :name, null: false
      t.references :country, null: false, foreign_key: { to_table: :countries, type: :uuid }
      t.references :state, null: false, foreign_key: { to_table: :states, type: :uuid }

      t.timestamps
    end

    add_index :cities, :name, unique: true # Add a unique index on the name column
  end
end
