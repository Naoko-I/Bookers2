class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def after_sign_up_path_for(resource)
     	flash[:notice] = "Signed in successfully."
      users_path(resource.id)
  end

  def after_sign_in_path_for(resource)
     	flash[:notice] = "Welcome!! You loged in successfully!!"
     	user_path(resource.id)
  end

  def after_sign_out_path_for(resource)
  	flash[:notice] = "Signed out successfully."
  	root_path
  end
end