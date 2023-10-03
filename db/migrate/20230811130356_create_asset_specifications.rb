class CreateAssetSpecifications < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :asset_specifications, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :value
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
