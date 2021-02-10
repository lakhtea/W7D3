class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:session_token] = @user.session_token
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def index
        @users = User.all
        if logged_in?
            render :index
        else
            redirect_to new_session_url
        end
    end

    def show
        if logged_in?
            @user = User.find(params[:id])
            render :show
        else
            redirect_to new_session_url
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end

