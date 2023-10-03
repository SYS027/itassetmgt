class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :countries do |t|
      t.string :country_name

      t.timestamps
    end
  end
end
