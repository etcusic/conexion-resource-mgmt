class DeckSearchesController < ApplicationController
    skip_before_action :validate_user
    before_action :validate_admin
    before_action :deck_search

    def show
    end

    def update
        binding.pry
    end

    private

    def deck_search_params
        params.require(:deck_search).permit(:admin_approved, :level, :user_id)
    end

    def deck_search
        @deck_search ||= DeckSearch.new 
    end

end