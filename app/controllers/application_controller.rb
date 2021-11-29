class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_kana_name, :last_kana_name, :postal_code, :address, :telephone_number])
  end

# ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    customer_path(resource.id)
  end

end
