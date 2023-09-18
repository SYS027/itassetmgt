class CreateCountries < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :countries, id: :uuid do |t|
      t.string :country_name

      t.timestamps
    end
  end

  def down
    drop_table :countries

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
