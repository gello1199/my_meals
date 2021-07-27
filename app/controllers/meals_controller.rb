class MealsController < ApplicationController

    def index
        @meals = Meal.all
    end

    def show
        @meal = Meal.find(params[:id])
    end

    def new
        @meal = Meal.new
    end

    def create

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def meal_params

    end
end
