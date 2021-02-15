class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include EndUser::OrdersHelper

  def after_sign_in_path_for(resource)
    if end_user_signed_in?
      end_user_path(current_end_user)
    else
      admin_items_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name,
    :email, :postal_code, :address, :phone_number])
  end
end


