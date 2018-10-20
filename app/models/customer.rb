class Customer < ApplicationRecord
	require 'digest/sha1'

 	before_save :encrypt_password, :email_verification
	after_save :clear_password

	attr_accessor :otp_code
 	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_confirmation_of :password
	has_secure_password


	def encrypt_password
  		if secondary_passcode.present?
    	salt = BCrypt::Engine.generate_salt
    	self.secondary_passcode= BCrypt::Engine.hash_secret(secondary_passcode, salt)
  		end
	end
	def clear_password
  		self.secondary_passcode = nil
	end


	def email_verified
		self.email_verification_token = nil
		self.is_email_verified=true
		self.save!
	end

	
	def email_verification
      if self.email_verification_token.blank?
          self.email_verification_token = SecureRandom.urlsafe_base64.to_s
      end
    end

	
end
