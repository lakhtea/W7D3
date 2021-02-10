class ApplicationController < ActionController::Base
    def current_user
        @user = User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end
end
