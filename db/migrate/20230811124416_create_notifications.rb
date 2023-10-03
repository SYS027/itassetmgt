class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :notify_id
      t.string :software_warranty_expiry
      t.string :hardware_warranty_expiry
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
