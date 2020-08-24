class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :public_action]
  before_action :configure_permitted_parameters,if: :devise_controller?


  private
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up,keys:[:email, :name])
	end
end
