class ChangeColumnTypeInStates < ActiveRecord::Migration[7.0]
  def change
    change_column :states, :id, 'integer USING CAST(id AS integer)'
  end
end
