class SignupController < ApplicationController
	require 'rubygems'
	require 'rotp'
	#POST /customers
	def signup
		@customer = Customer.new(customer_params)
		totp = ROTP::TOTP.new("base32secret3232")
		if(totp.verify_with_drift(params[:customer][:otp_code],50))
			if(@customer.save)
			UserMailer.sample_mail(@customer).deliver_now
			render json:{"message":"Successfully saved"}
			else
			render json:@customer.errors.full_messages
			end
		else
			render json:{"message":"unsuccessfull otp verification"}
		end
	end

	#GET display all customers
	def customers
		render json:Customer.all
	end

	#DELETE customer using Id
	def del
		Customer.destroy(params[:id])
		render json:{"message":"Successfully destroyed"}
	end

	#POST signIn customer
	def signIn
		@customer = Customer.find_by(email: params[:email])
		puts @customer.password_digest
		render json: @customer.authenticate(params[:password])
	end

	#POST Request OTP for signup (email)
	def request_otp_for_signup
		UserMailer.otp_mail(params[:email]).deliver_now
	end

	def set_secondary_passcode
		@customer = Customer.find_by(id: params[:id])
		@customer.secondary_passcode = params[:secondary_passcode]
		if(@customer.save)
			render json:{"message":"Successfully update passcode"}
		else
			render json:{"message":"Update unsucessful"}
		end
	end

	private 

	def customer_params
		params.require(:customer).permit(:first_name,:last_name,:email,:password,:password_confirmation,:otp_code)
	end
end
