class AddStatusToDepartments < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto') # Add this line if you want to use UUIDs

    add_column :departments, :status, :boolean, default: true
  end
end
