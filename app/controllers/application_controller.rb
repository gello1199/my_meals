class ApplicationController < ActionController::Base
    include ApplicationHelper

    private 

    def redirect_if_not_logged_in?
        if !logged_in?
        flash[:message] = "MUST SIGNUP OR LOGIN TO ACCESS PAGE"
        redirect_to root_path 
        end
    end

    def redirect_if_not_authorized
        @user = User.find_by_id(params[:id])
        if  @user.id != current_user.id
            redirect_to user_path(current_user)
        end
    end


end
