class CreateLocation < ActiveRecord::Migration[7.0]
	def change
	  create_table :locations do |t|
		t.references :company, null: false, foreign_key: true
		t.string :office_name
		t.string :poc_name
		t.string :poc_email
		t.string :poc_contact
		t.references :country, null: false, foreign_key: true
		t.references :state, null: false, foreign_key: true
		t.references :city, null: false, foreign_key: true
		t.string :zip_code
		t.boolean :is_active
  
		t.timestamps
	  end
	end
  end
  