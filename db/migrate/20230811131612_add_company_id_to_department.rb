class AddCompanyIdToDepartment < ActiveRecord::Migration[7.0]
  def change
    add_reference :departments, :company, foreign_key: true
  end
end
