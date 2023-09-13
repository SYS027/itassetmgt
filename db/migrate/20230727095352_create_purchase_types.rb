class CreatePurchaseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_types do |t|
      t.integer :purchase_type_id
      t.string :purchase_type
      t.boolean :is_active

      t.timestamps
    end
  end
end
