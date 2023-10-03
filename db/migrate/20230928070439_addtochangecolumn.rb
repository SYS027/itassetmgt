class Addtochangecolumn < ActiveRecord::Migration[7.0]
  def change
    # Check if the foreign keys exist before removing them
    if foreign_key_exists?(:employees, :locations)
      remove_reference :employees, :location, foreign_key: true
    end

    if foreign_key_exists?(:employees, :departments)
      remove_reference :employees, :department, foreign_key: true
    end

    # Add the references with the correct data type
    add_reference :employees, :location, foreign_key: true
    add_reference :employees, :department, foreign_key: true, type: :uuid
  end
end
