class LocationsController < ApplicationController

    def index
        @locations = Location.all
    end

    def show
        @location = Location.find_by_id[:id]
    end

    
    
end
