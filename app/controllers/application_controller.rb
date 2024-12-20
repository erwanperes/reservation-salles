class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  allow_browser versions: :modern
  private
  
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)  # Vérifie si c'est bien un utilisateur qui se connecte
      main_path
    else
      root_path  # Route par défaut si ce n'est pas un utilisateur
    end
  end
  
end

