class AddAuthTokenToAdmins < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    change_table :admins, id: :uuid do |t|
      t.string :auth_token
    end
  end

  def down
    change_table :admins, id: :primary_key do |t|
      t.remove :auth_token
    end

    disable_extension 'pgcrypto' if extension_enabled?('pgcrypto')
  end
end
