class Customer < ApplicationRecord
	require 'digest/sha1'

 	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
  		if secondary_passcode.present?
    	salt = BCrypt::Engine.generate_salt
    	self.secondary_passcode= BCrypt::Engine.hash_secret(secondary_passcode, salt)
  		end
	end
	def clear_password
  		self.secondary_passcode = nil
	end

	attr_accessor :otp_code
 	EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true #password_confirmation attr
	validates_confirmation_of :password
	has_secure_password

	private
	def confirmation_token
      if self.email_verification_token.blank?
          self.email_verfication_token = SecureRandom.urlsafe_base64.to_s
      end
    end
	
end
