class CreateAssetSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :asset_specifications do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :value
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
