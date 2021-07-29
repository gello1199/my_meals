class MealsController < ApplicationController
    before_action :redirect_if_not_logged_in?


    def index
        @meals = Meal.all
    end

    def show
        @meal = Meal.find_by_id(params[:id])
    end

    def new
        @meal = Meal.new
    end

    def create
        @meal = Meal.new(meal_params)
        @meal.save
        redirect_to meals_path
    end

    def edit
        @meal = Meal.find_by_id(params[:id])
    end

    def update
        @meal = Meal.find_by_id(params[:id])
         @meal.update(meal_params)
         redirect_to meal_params(@meal)
    end

    def destroy
        @meal = Meal.find_by_id(params[:id])
        @meal.destroy
        redirect_to meals_path
    end

    private

    def meal_params
        params.require(:meal).permit(:name)
    end
end
