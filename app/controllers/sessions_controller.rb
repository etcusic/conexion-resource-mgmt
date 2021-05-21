class SessionsController < ApplicationController
    # skip_before_action :require_login
    # skip_before_action :validate_user

    def new
    end

    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            initialize_session
            redirect_to user_path(@user)
        else
            # flash error is not working
            flash[:error] = "Invalid email or password. Please try again."
            redirect_to '/login'
        end
    end

    def create_with_omniauth
        binding.pry
        @user = User.find_by(email: auth['info']['email'])
        #does this account for invalid data sent from facebook or wherever?
        if !@user
            @user = User.new_user_oauth
        end
        binding.pry
        initialize_session
        redirect_to user_path(@user)
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

    def auth
        request.env['omniauth.auth']
    end
    
end
