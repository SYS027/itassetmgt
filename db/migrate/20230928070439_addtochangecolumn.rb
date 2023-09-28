class Addtochangecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :location
    remove_column :employees, :department
    add_reference :employees, :location, foreign_key: true , type: :uuid 
    add_reference :employees, :department, foreign_key: true , type: :uuid 
  end
end
