class RestaurantsController < ApplicationController

  before_action :load_restaurant_owner

  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = @restaurant_owner.restaurants.build(restaurant_params)
    @restaurant.restaurant_owner_id = current_restaurant_owner.id

    if @restaurant.save
      redirect_to restaurant_owner_path(@restaurant_owner), notice: "#{@restaurant.name} is now active on SeatYourself." 
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant = @restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :restaurant_owner_id)
  end

  def load_restaurant_owner
    @restaurant_owner = RestaurantOwner.find(current_restaurant_owner.id)
  end

end
