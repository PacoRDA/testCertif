class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!
  def index
    fav = []
    @restaurants = Restaurant.all
    @restaurants.each do |restaurant|
      fav << Favorite.where(restaurant: restaurant, user: current_user)
    end
    @favorites = fav
  end

  def show
    @reservation = Reservation.new
    @rating = Rating.new

    @ratings = @restaurant.ratings
    @average_rating = @ratings.average(:rate)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone_number, :rating, :category_id, :photo)
  end
end
