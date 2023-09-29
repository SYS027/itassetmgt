class ChangeCountryIdToIntegerInStates < ActiveRecord::Migration[6.0]
  def change
    change_column :states, :country_id, 'integer USING CAST(country_id AS integer)'
  end
end
