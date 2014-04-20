class RestaurantOwnerSessionsController < ApplicationController

  def new
  end

  def create
    restaurant_owner = Restaurant_owner.find_by_email(params[:email])
    if restaurant_owner && restaurant_owner.authenticate(params[:password])
      session[:restaurant_owner_id] = restaurant_owner.id 
      redirect_to restaurants_path, notice: "Welcome back #{restaurant_owner.first_name}!"
    else
      flash.now[:alert] = "Invalid Email or Password"
      render :new
    end
  end

  def destroy
    session[:restaurant_owner_id] = nil
    redirect_to restaurants_path, notice: "Thank you for choosing SeatYourself. We look forward to having you back!"
  end

end
