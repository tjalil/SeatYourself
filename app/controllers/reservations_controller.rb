class ReservationsController < ApplicationController

  before_action :load_user, only: [:new, :create]

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @user.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to user_show(@reservation.user_id), notice: "Successfully created your reservation"
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_time, :party_size, :restaurant_id)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end
