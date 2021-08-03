class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def new
        @review = Review.new
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

    def review_params

    end

end
