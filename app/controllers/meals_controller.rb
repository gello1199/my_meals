class MealsController < ApplicationController
    before_action :redirect_if_not_logged_in?


    def index
        # if params[:restaurant_id] && @restaurant = Restaurant.find_by_id[:restaurant_id]
        #     @meals = Meal.restaurants
        # else
        # @meals = Meal.all
        # end
        @meals = Meal.all
    end

    def show
        @meal = Meal.find_by_id(params[:id])
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    end

    def new
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @meal = @restaurant.meals.build
    end

    def create
        @meal = Meal.new(meal_params)
        @meal.user = current_user
        if params[:restaurant_id]
            @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        end
        # byebug
        @meal.save
        redirect_to restaurant_meal_path(@restaurant, @meal)
    end

    def edit
        @meal = Meal.find_by_id(params[:id])
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    end

    def update
        # byebug
        @meal = Meal.find_by_id(params[:id])
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
         if @meal.update(meal_params)
            redirect_to restaurant_meal_path(@restaurant, @meal)
         else
            render :edit
         end
    end

    def destroy
        @meal = Meal.find_by_id(params[:id])
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        # byebug
        @meal.destroy
        redirect_to restaurant_path(@restaurant)
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :description, :restaurant_id)
    end
end
