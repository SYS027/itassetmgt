class Addtochangecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :location
    remove_column :employees, :department
    add_reference :employees, :location, foreign_key: { to_table: :employees, type: :uuid }
    add_reference :employees, :department, foreign_key: { to_table: :employees, type: :uuid }
  end
end
