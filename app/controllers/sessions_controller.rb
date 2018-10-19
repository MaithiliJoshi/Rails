class SessionsController < ApplicationController
  def new
  end

  def login
  	 @customer = Customer.find_by(email: params[:session][:email].downcase)
    if @customer && @customer.authenticate(params[:session][:password])
    	session[:user_id] = @customer[:id]
    	render json:{"message":"Login successful"}
    else
      	render json:{"message":"Incorrect email/password"}
    end
  end

  def current_customer
    if session[:user_id]
      @current_user ||= Customer.find_by(id: session[:user_id])
    end
    render json:@current_customer
  end

  def logged_in?
  	!current_customer.nil?
  end

  def logout
  	session.delete(:user_id)
  end
end
