class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
  # attribute :reset_token_expires_at, :datetime
  #        def reset_token_expired?
  #         reset_token_expires_at < Time.now
  #       end
  #       def reset_password(password)
  #         self.password_reset_token = nil
  #         self.password = password
  #         save!
  #       end

  
end
