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

  def time_slots

    reservation_interval = 1.hour
    @restaurant = Restaurant.find(params[:id])

    if (Time.zone.now + 15.minutes) > (Time.zone.now + 1.hours).at_beginning_of_hour
      first_time_slot = [(Time.zone.now.hour + 2.hour), @restaurant.opening_time.hour].max
    else
      first_time_slot = [(Time.zone.now.hour + 1.hour), @restaurant.opening_time.hour].max
    end
    
    # last_time_slot = @restaurant.closing_time.hour
    last_time_slot = Time.zone.now + 10.hours

    available_time_slots = []
    reservation_time = first_time_slot

    while reservation_time < last_time_slot do

      available_time_slots << reservation_time

      reservation_time += reservation_interval

      # if (reservation_time + reservation_interval) > @restaurant.closing_time
      #   reservation_time = @restaurant.opening_time + 1.day
      # end

    end

    available_time_slots.map! do |time|
      time.strftime('%A %e, %B at %l:%M %P')
    end

    available_time_slots
  end
  
end
