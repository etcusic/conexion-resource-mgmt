class SessionsController < ApplicationController
    # skip_before_action :require_login
    skip_before_action :validate_user

    def new
    end

    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            initialize_session
            redirect_to_profile
        else
            # flash error is not working
            flash[:error] = "Invalid email or password. Please try again."
            redirect_to '/login'
        end
    end

    def visitor_login
        # binding.pry
        session[:user_id] = 0
        redirect_to visitors_path
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def session_params
        params.require(:user).permit(:email, :password)
    end

    def initialize_session
        session[:user_id] = @user.id
    end
    
end
