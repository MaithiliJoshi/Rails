class UserMailer <ApplicationMailer
	require 'rubygems'
	require 'rotp'
	
	def sample_mail(customer)
	@customer = customer
    mail(to: customer.email, subject: 'Some progress ahead')
	end

	def otp_mail(email) 
		totp = ROTP::TOTP.new("base32secret3232")
		@otp=totp.now 
		mail(to: email, subject: 'OTP for signup')
	end


 	def email_verification(customer)
	@customer = customer
	@url = 
    mail(to: customer.email, :subject => "Email Verification")
 end
end
