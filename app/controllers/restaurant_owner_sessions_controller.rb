class RestaurantOwnerSessionsController < ApplicationController

  def new
  end

  def create
    restaurant_owner = RestaurantOwner.find_by_email(params[:email])
    if restaurant_owner && restaurant_owner.authenticate(params[:password])
      session[:restaurant_owner_id] = restaurant_owner.id 
      redirect_to restaurant_owner_path(restaurant_owner.id), notice: "Welcome back #{restaurant_owner.first_name}!"
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
