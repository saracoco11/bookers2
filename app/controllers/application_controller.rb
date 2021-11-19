class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
  
  def after_sign_in_path_for(resorce)
    user_path(current_user.id)
  end

  def after_sign_aut_path_for(resource)
    root_path
  end

end
