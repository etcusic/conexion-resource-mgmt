class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning
    before_action :validate_user, except: [:home]
    helper_method :current_user, :redirect_to_profile, :logged_in?, :users_stuff? 

    def home
    end

    private

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def redirect_to_profile
        redirect_to user_path(current_user)
    end

    def logged_in?
        session[:user_id]
    end
    
    def users_stuff?
        session[:user_id] == params[:id].to_i
    end

    # validate admin

    def validate_user
        if !users_stuff?
            flash[:error] = "You are not authorized for the page requested."
            redirect_to errors_path
        end
    end
    
end
