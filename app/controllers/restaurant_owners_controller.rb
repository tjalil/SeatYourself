class RestaurantOwnersController < ApplicationController

  before_action :find_restaurant_owner, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    # if current_restaurant_owner
    #   @restaurant = @restaurant_owner.restaurants.build
    # end
  end

  def new
    @restaurant_owner = RestaurantOwner.new
  end

  def create
    @restaurant_owner = RestaurantOwner.new(restaurant_owner_params)
    if @restaurant_owner.save
      session[:restaurant_owner_id] = @restaurant_owner.id
      redirect_to restaurant_owner_path(@restaurant_owner.id), notice: "Welcome to SeatYourself, #{@restaurant_owner.first_name}!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant_owner.delete
    redirect_to restaurants_path
  end

  private

  def restaurant_owner_params
    params.require(:restaurant_owner).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_restaurant_owner
    @restaurant_owner = RestaurantOwner.find(params[:id])
  end
end
