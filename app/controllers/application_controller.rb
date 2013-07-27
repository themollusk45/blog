class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  #Force signout to prevent CSRF attacks
  def handle_unverified_request
  	sign_out
  	super
  end

  def check_for_mobile
  	session[:mobile_override] = params[:mobile] if params[:mobile]
  end

  def mobile_device?
  	if session[:mobile_override]
  		session[:mobile_override] == "1"
  	else
  		#Season this regexp to taste...
  		request.user_agent =~ /Mobile|webOS/
  	end
  end
  helper_method :mobile_device?
end

