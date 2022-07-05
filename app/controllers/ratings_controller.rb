class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating.restaurant = @restaurant
    if @rating.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurants_path
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rate, :review)
  end
end
