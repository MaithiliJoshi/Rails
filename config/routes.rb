Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/login'
	 post 'otp/request_otp'
	 post 'signup/signup'
	 get 'signup/customers'
	 post 'signup/del'
	 post 'signup/signIn'
	 post 'signup/request_otp_for_signup'
	 post 'signup/set_secondary_passcode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
