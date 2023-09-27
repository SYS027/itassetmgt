class CreateCities < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :cities, id: :uuid do |t|
      t.string :city_name
      t.references :country, null: false, foreign_key: { to_table: :countries, type: :uuid }
      t.references :state, null: false, foreign_key: { to_table: :states, type: :uuid }

      t.timestamps
    end
  end
end
