
class OtpController < ApplicationController
	require 'rubygems'
	require 'rotp'
	#POST /request_otp
	def request_otp
		puts params[:email]
		puts params[:mobile]
		otp_secret = ROTP::Base32.random_base32 
		totp = ROTP::TOTP.new(otp_secret)
		value=totp.now 
		puts value
		puts totp.verify(value)
		render json:{"cat":"Success"}
	end
end
