class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def configure_permitted_parameters
      # added_attrs = [ :name, :email, :password, :password_confirmation ]
      # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      # devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      # sign_inのときに、nameも許可する
      devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
    # sign_upのときに、nameも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    #account_updateのときに、nameも許可する
      devise_parameter_sanitizer.permit(:account_update, keys:[:name])
  end

end
