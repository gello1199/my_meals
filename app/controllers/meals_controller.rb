class MealsController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_meal, only: [:show, :edit, :update, :destroy]


    def index
        @meals = Meal.all
    end

    def show
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def new
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @meal = @restaurant.meals.build #meal gets created, then saved in my hidden_fields where it's being assigned to restaurant_id
    end

    def create
        @meal = Meal.new(meal_params)
        @meal.user = current_user
        if params[:restaurant_id] #params from url are getting passed
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
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        meal_restrictions
    end

    def update
        # byebug
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
         if @meal.update(meal_params)
            redirect_to restaurant_meal_path(@restaurant, @meal)
         else
            render :edit
         end
    end

    def destroy
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
        @meal = Meal.find(params[:id])
    end

end
