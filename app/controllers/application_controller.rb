class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :current_cart
    include(ApplicationHelper)

    def configure_permitted_parameters
      # , :avatar_attachment ,:is_alive, :avatar,:first_name, :last_name
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation,:first_name, :last_name, :username,:phone_number)}
      devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :username, :is_alive, :email, :password, :password_confirmation, :current_password, :avatar)}
    end
  
    private
    def current_cart
      if current_user && !session[:cart_id]
          cart = Cart.find_by(id:current_user.cart.id)
          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
      end
    end
end
  