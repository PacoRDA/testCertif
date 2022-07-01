class ReservationsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.restaurant = @restaurant
    @reservation.user = current_user
    if @reservation.save
      render :show
    else
      redirect_to restaurant_path(@restaurant)
    end
  end

  def update
  end

  def show
    @reservation = Reservation.find_by(restaurant: params[:restaurant_id], user: current_user)
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :guests_number)
  end
end
