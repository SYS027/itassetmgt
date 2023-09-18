class CreatePurchaseTypes < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :purchase_types, id: :uuid do |t|
      t.string :purchase_type
      t.boolean :is_active

      t.timestamps
    end
  end

  def down
    drop_table :purchase_types

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
