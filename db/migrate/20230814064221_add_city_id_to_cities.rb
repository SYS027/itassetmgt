class AddCityIdToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :city_id, :integer
  end
end
