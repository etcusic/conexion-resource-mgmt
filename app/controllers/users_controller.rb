class UsersController < ApplicationController
    before_action :current_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :validate_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save   
            session[:user_id] = @user.id
            redirect_to_profile
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to_profile
        else 
            render :edit
        end
    end

    def destroy
        current_user.destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:id, :email, :name, :password, :admin, :image)
    end

end
