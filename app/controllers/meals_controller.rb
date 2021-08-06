class MealsController < ApplicationController
    before_action :redirect_if_not_logged_in?


    def index
        @meals = Meal.all
    end

    def show
        @meal = Meal.find(params[:id])
        @restaurant = Restaurant.find(params[:restaurant_id])
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
        if @meal.save
        redirect_to restaurant_meal_path(@restaurant, @meal)
        else
            render :new
        end
    end

    def edit
        find_meal
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        meal_restrictions
    end

    def update
        # byebug
        find_meal
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
         if @meal.update(meal_params)
            redirect_to restaurant_meal_path(@restaurant, @meal)
         else
            render :edit
         end
    end

    def destroy
        find_meal
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        # byebug
        @meal.destroy
        redirect_to restaurant_path(@restaurant)
    end

    private

    def meal_params
        params.require(:meal).permit(:name, :description, :restaurant_id)
    end

    def meal_restrictions
        if @meal.user != current_user
            redirect_to restaurant_meal_path(@restaurant, @meal)
        end
    end

    def find_meal
        @meal = Meal.find_by_id(params[:id])
    end

end
