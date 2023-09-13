class AddCountryIdToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :country_id, :integer
  end
end
