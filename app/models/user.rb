class User < ApplicationRecord
    has_one :verified_user 
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    after_create :verify_token

    def email_activate
        @verifed_u = VerifiedUser.find_by(user_id: self.id)
        @verifed_u.is_verified = true
        @verifed_u.save
        self.verification_token = nil
        save(validate: false)
    end

    private
    def verify_token
      if self.verification_token.blank?
          self.verification_token = SecureRandom.urlsafe_base64.to_s
          self.save!
      end
    end
end
