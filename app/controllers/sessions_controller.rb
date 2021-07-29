class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to restaurants_path
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to retaurants_path
    end

end