class CreateLocations < ActiveRecord::Migration[7.0]
	def change
	  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  
	  create_table :locations, id: :uuid do |t|
		t.references :company, null: false, foreign_key: true, type: :uuid
		t.string :office_name
		t.string :poc_name
		t.string :poc_email
		t.string :poc_contact
		t.references :country, null: false, foreign_key: true, type: :uuid
		t.references :state, null: false, foreign_key: true, type: :uuid
		t.references :city, null: false, foreign_key: true, type: :uuid
		t.string :zip_code
		t.boolean :is_active
  
		t.timestamps
	  end
	end
  end
  