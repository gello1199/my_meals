class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.save
        redirect_to restaurants_path
    end

    def edit
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    def update
        @restaurant = Restaurant.find_by_id(params[:id])
        @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
    end

    def destroy

    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name)
    end

end
