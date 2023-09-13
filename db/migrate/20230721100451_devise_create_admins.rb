class DeviseCreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :email,null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :phone_number, null: false, default: 0
      t.integer :country_code, null: false, default: +91
      t.string :password,null: false, default: ""
      t.string :confirm_password,null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
  end
end
