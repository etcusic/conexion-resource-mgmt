class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning
    # before_action :require_login, except: [:home]
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

    # def require_login
    #     if !session[:user_id]
    #         redirect_to "/login"
    #     end
    # end

    def validate_user
        if !users_stuff?
            flash[:error] = "Invalid email or password. Please try again."
            redirect_to "/errors/invalid_user"
        end
    end
end
