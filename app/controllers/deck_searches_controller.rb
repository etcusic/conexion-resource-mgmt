class DeckSearchesController < ApplicationController
    skip_before_action :validate_user
    before_action :validate_admin
    before_action :initialize_search

    def show
    end

    private

    def deck_search_params
        params.permit(:admin_approved, :level, :user_id)
    end

    def initialize_search
        admin = deck_search_params[:admin_approved] ? deck_search_params[:admin_approved] : ""
        level = deck_search_params[:level] ? deck_search_params[:level] : ""
        user_id = deck_search_params[:user_id] ? deck_search_params[:user_id] : ""
        @deck_search = DeckSearch.new(admin, level, user_id)
    end

end