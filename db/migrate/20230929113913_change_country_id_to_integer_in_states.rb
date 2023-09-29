class ChangeCountryIdToIntegerInStates < ActiveRecord::Migration[7.0]
  def change
    change_column :states, :country_id, :integer
  end
end
