class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :current_user_cart

  def current_user
    @current_user ||= User.first
  end

  def current_user_cart
    @current_user_cart ||= current_user.cart
  end
end
