class FavoritesController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = Favorite.new(user: current_user, restaurant: @restaurant)
    if @favorite.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurants_path
    end
  end
end
