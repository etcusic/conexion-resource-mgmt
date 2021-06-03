class DeckSearchesController < ApplicationController
    skip_before_action :validate_user
    before_action :validate_admin

    def new
        @deck_search = DeckSearch.new
    end

    def show
    end

    def update
    end

    private

    def deck_search_params
        params.permit(:admin_approved, :level, :user_id)
    end


end