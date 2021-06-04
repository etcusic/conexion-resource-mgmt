class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning
    helper_method :current_user, :redirect_to_profile, :logged_in?, :users_stuff?, :validate_user, :validate_admin, :validate_user_or_admin

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

    def validate_user
        if !users_stuff?
            flash[:error] = "You are not authorized for the page requested."
            redirect_to errors_path
        end
    end
    
    def validate_admin
        if !current_user.admin
            flash[:error] = "You are not authorized for the page requested. This section is only for Administrators."
            redirect_to errors_path
        end
    end

    def validate_user_or_admin
        if !current_user.admin && !users_stuff? && session[:user_id] != params[:user_id].to_i
            flash[:error] = "You are not authorized for the page requested."
            flash[:info] = "You must either be the creator of this deck or an administrator."
            redirect_to errors_path
        end
    end

end
