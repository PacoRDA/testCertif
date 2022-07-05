class RatingsController < ApplicationController
  def create
    @reservation = Reservation.find(params[:reservation_id])
    @rating = Rating.new(rating_params)
    @rating.reservations_id = @reservation.id
    if @rating.save
      redirect_to restaurant_path(@reservation.restaurant)
    else
      redirect_to restaurants_path
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rate, :review)
  end
end
