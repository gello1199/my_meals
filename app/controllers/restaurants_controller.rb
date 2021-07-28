class RestaurantsController < ApplicationController

    def index
        if params[:meal_id] && @meal = Meal.find_by_id[:meal_id]
            @restaurants = Restaurant.meal
        else
            @restaurants = Restaurant.all
        end
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
        @restaurant = Restaurant.find_by_id[:params[:id]]
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name)
    end

end
