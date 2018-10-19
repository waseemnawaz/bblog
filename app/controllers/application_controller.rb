class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
  	redirect_to main_app.root_url, alert: exception.message
	end

	def after_sign_in_path_for(resource)
		user_path(resource)
	end 

end
