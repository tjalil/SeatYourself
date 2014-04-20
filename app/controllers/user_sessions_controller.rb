class UserSessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to restaurants_path, notice: "Welcome back #{user.first_name}!"
    else
      flash.now[:alert] = "Invalid Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_path, notice: "Thank you for choosing SeatYourself. We look forward to having you back!"
  end
end
