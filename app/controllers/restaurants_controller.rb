class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new(restaurant_params)
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
