class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_restaurant_owner

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_restaurant_owner
    @current_restaurant_owner ||= RestaurantOwner.find(session[:restaurant_owner_id]) if session[:restaurant_owner_id]
  end
  
end
