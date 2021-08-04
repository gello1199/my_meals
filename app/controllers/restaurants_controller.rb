class RestaurantsController < ApplicationController
    before_action :redirect_if_not_logged_in?

    def index
        @restaurants = Restaurant.all
            # @restaurants = Restaurant.order_by_location
    end

    def show
        @restaurant = Restaurant.find_by_id(params[:id])
        # byebug
    end

    def new
        @restaurant = Restaurant.new
        @restaurant.build_location
        @restaurant.meals.build
        # @restaurant.reviews.build
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.meals.each do |m|
            m.user = current_user
        end
        # byebug
        if @restaurant.save
        redirect_to restaurants_path
        else 
            @restaurant.build_location
            render :new
        end
    end

    def edit
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    def update
        @restaurant = Restaurant.find_by_id(params[:id])
        # byebug
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else
            render :edit
        end
    end

    def destroy
        @restaurant = Restaurant.find_by_id(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :location_id, location_attributes: [:name], meals_attributes: [:name, :description, :id])
    end

end
