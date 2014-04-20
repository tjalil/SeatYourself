class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner_id = current_owner.id

    if @restaurant.save
      redirect_to restaurants_path, notice: "#{@restaurant.name} is now active on SeatYourself." 
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
