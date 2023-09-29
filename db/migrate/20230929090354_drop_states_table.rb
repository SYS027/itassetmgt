class DropStatesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :states
  end

  def down
    create_table :states, id: :serial do |t|
      t.string :state_name
      t.string :state_id
      t.integer :country_id
      t.timestamps
    end
  end
end
