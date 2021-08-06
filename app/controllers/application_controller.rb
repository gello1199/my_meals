class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    include ApplicationHelper

    private 

    def redirect_if_not_logged_in?
        if !logged_in?
        flash[:message] = "MUST SIGNUP OR LOGIN TO ACCESS PAGE"
        redirect_to root_path 
        end
    end

    def redirect_if_not_authorized
        @user = User.find(params[:id])
        if  @user.id != current_user.id
            redirect_to user_path(current_user)
        end
    end

    def record_not_found
        redirect_to restaurants_path, notice: "Page Not Found"
    end


end
