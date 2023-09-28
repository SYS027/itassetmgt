class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities, id: :uuid do |t|
      t.string :name
      t.references :country, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end