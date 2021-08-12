class RestaurantsController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

    def index
        @restaurants = Restaurant.order_by_location

        if params[:query]
        @restaurants = Restaurant.search_by_location(params[:query])
        end
    end


    def show
        # byebug
    end

    def new
        @restaurant = Restaurant.new
        @restaurant.build_location
        2.times{@restaurant.meals.build}

    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.meals.each {|m| m.user = current_user}

        if @restaurant.save
        redirect_to restaurants_path
        else 
            @restaurant.build_location
            2.times{@restaurant.meals.build}
            render :new
        end
    end

    def edit
    end

    def update
        # byebug
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else
            render :edit
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :location_id, location_attributes: [:name], meals_attributes: [:name, :description, :id])
    end

    def find_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

end
