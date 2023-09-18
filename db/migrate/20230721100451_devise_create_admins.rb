class DeviseCreateAdmins < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'citext' # Enable case-insensitive text (if not already enabled)

    create_table :admins do |t|
      t.citext :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :phone_number, null: false, default: '0' # Changed to a string
      t.string :country_code, null: false, default: '+91' # Changed to a string
      t.string :password, null: false, default: '' # It's recommended to use encrypted_password for Devise
      t.string :confirm_password, null: false, default: '' # You can remove this field if it's not needed
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :admins, :email, unique: true
    add_index :admins, :reset_password_token, unique: true
  end
end
