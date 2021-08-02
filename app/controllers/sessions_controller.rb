class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid Email or Password"
            redirect_to login_path
        end
    end

    def omniauth
        # byebug
        user = User.find_or_create_by(provider: auth[:provider], uid: auth[:uid])do |u|
        # byebug
        u.email = auth[:info][:email]
        u.first_name = auth[:info][:name]
        u.password = SecureRandom.hex(15)
        end
        # byebug
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to '/login'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to restaurants_path
    end

    def welcome
      render layout: "homepage"
    end

    def signup
        render layout: "signup"
    end

    def auth
        request.env['omniauth.auth']
      end

end